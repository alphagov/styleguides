# Puppet style guide

## General

-   Run `rake spec` and `rake lint` to run the tests and lint before
    checking in.

## Things that should not be in the Puppet Repo

-   **Secrets.** It is bad practise to embed your secret data (passwords, 
    tokens) within Puppet. To do so means that even if you specify that a 
    secret applies to one particular environment it is available on the 
    PuppetMaster for every environment. It is good practise to store 
    secrets in `alphagov/deployment/puppet/extdata/${environment}.csv`. 
    Please make sure where necessary you have different secrets for each 
    value.
    
-   **Per Environment switches**. The puppet repo should not know the 
    specifics of each environment. By switching on platform or environment
    variables, you make it difficult to add new platforms and hard to ensure
    that consistent behaviour is applied across all environments. To apply a 
    catalog item to a subset of environments you should:
    1. Add a feature toggle to extdata (default goes in `common.csv`, per 
       environment value goes in `${environment}.csv`. Be aware that 
       extdata for environments is in the `deployment` repo, but extdata for 
       `development` is in the development repo. `common.csv` exists in both
       repos.
    2. Switch on resources based on the feature toggle in extdata:
       [puppet/modules/govuk/manifests/node/s_base.pp#LC25]
       (https://github.com/alphagov/puppet/blob/master/modules/govuk/manifests/node/s_base.pp#LC25)
    3. Where possible, create your switches at the machine manifest level (as 
       above) rather than within a module. 

## Dependency management

-   Prefer `require` to `before`.
-   Do not use `->` and `~>`, use `require`, `notify` or `subscribe`
    instead.
-   *Never* use `<-` or `<~`. (Lint will stop you, anyway.)
-   Don't break encapsulation. In particular, a resource within one module
    not create a dependency (require or notify) to a resource deep within
    another. For example, `File[/etc/nginx/sites-available/foo]` from module
    `foo` should *not* directly notify `Service[nginx]` in module `nginx`.
    Instead consider these options:
  -   use the anchor pattern to ensure dependencies are passed up and down
      the include hierarchy correctly, and specify the dependency at the
      top level. In our example, this means we would have:

        ```
        class {'foo': notify => Class['nginx']}
        class {'nginx':}
        ```

  -   create a defined type within one module which other modules can use
      which will set up the correct dependencies. See `nginx::config::site`
      for an example -- this is a defined type which allows other modules
      to create an nginx configuration and will make sure it happens after
      `nginx::package` and before `nginx::service`, without the other module
      even knowing the existence of these classes.
-   When a class includes or instantiates another class, consider
    whether you need to use the anchor pattern (see below). In
    particular, for a top-level class `foo` which includes
    `foo::package`, `foo::config` and `foo::service`, *definitely* use
    the anchor pattern.

### Anchor pattern example

The problem:

Suppose I have an nginx class, which installs nginx and starts it
running. We want to ensure logstash is running before nginx, so that
we catch all of the log files. We also want to run some smoke tests
every time nginx is restarted. You might expect this to work out of
the box:

    class {'nginx':
        require => Class['logstash'],
        notify  => Class['smoke-tests'],
    }

But by default this will not do what you want, because puppet
dependencies between classes don't work the obvious way. If the
`nginx` class includes `nginx::package`, `nginx::config`, and
`nginx::service`, then these classes will not inherit the `require`
and `notify` directives we have specified, and so we have no guarantee
that nginx will be installed after logstash, and that smoke tests will
be run after nginx is restarted.

What we have to do to get this to work is to use the anchor pattern
within the nginx class, something like this:

    class nginx {
        anchor {'nginx::begin':
            notify => Class['nginx::service']
        }
        
        class {'nginx::package':
            require => Anchor['nginx::begin']
        }
        
        class {'nginx::config':
            require => Class['nginx::package']
            notify  => Class['nginx::service']
        }
        
        class {'nginx::service':
            notify => Anchor['nginx::end']
        }
        
        anchor {'nginx::end':
        }
    }

Now, when you specify at the top that the `nginx` class `require`s the
`logstash` class, this relationship is inherited by the anchors
because they are first-class resources and not merely classes. So
`Anchor[nginx-begin]` and `Anchor[nginx-end]` both require
`Class[logstash]`. We then use all of the other relationships within
the class to ensure the dependencies are passed on correctly. In this
case, we can be sure that `Class[nginx::package]` is installed after
`Class[logstash]` because `Class[nginx::package]` requires
`Anchor[nginx::begin]` which in turn requires `Class[logstash]`.

Similarly, we can be sure that the smoke tests will run after nginx is
restarted because `Class[nginx::service]` notifies
`Anchor[nginx::end]`, which in turn notifies `Class[smoke-tests]`.

Without the anchors, the relationships specified on `Class[nginx]`
would simply not be passed on to the included classes such as
`Class[nginx::package]`.

More information on the anchor pattern can be found on
[the puppet wiki](http://projects.puppetlabs.com/projects/puppet/wiki/Anchor_Pattern).

(NB the anchor type in puppetstdlib
[does not propagate refresh events](http://projects.puppetlabs.com/issues/12510),
so that the notify example above will fail. We have our own anchor
type in puppet/modules/anchor, which fixes this bug.)

## Process supervision

If you are starting a daemonised process, you should strive to create an
Upstart script for it, so that it benefits from supervision (ie it will
be restarted if it dies). There is more
[documentation](https://sites.google.com/a/digital.cabinet-office.gov.uk/wiki/projects-and-processes/projects-products/hosting-and-infrastructure-1/processsupervision)
available on the Infrastructure Wiki.

## Nagios checks

When creating a service, it is desirable to also check that it is
functioning correctly. Our standard for monitoring is Nagios. You can
see more details of how to monitor a service with Nagios in the
[nagios puppet module](https://github.com/alphagov/puppet/blob/master/modules/nagios/manifests/client/checks.pp)
