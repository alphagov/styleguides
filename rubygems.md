# Rubygems

## Naming

In general, the gem name should be the same as the thing you require when using
it.  This means using `_`, and not `-` to separate multi-word gem names.  See
http://guides.rubygems.org/name-your-gem/ for more detailed guidance.

## Versioning

Follow the guidelines on [semver.org](http://semver.org/) for assigning version
numbers.

Versions should only be changed in a commit of their own, in a pull request of
their own. This alerts team members to the new version and allows for
last-minute scrutiny before the new version is released. Also, by raising a
separate pull request, we avoid version number conflicts between feature
branches.

## File layout

We should follow the scheme used by Bundler when creating gems (see [this
asciicast](http://asciicasts.com/episodes/245-new-gem-with-bundler)).

Some points to note:

* The version is stored in a file by itself in `lib/<gem_name>/version.rb`.
* The Gemfile references the gemspec for gem dependencies.  All gem
  dependencies should be specified in the gemspec.
* The Gemfile.lock is **never** committed (it should be in the `.gitignore`
  file).

## Releasing gem versions

This should be done using the [`gem_publisher`
gem](https://github.com/alphagov/gem_publisher).  See `gem_publisher`'s
[README](https://github.com/alphagov/gem_publisher#readme) for details on
setting this up.

## Jenkins build script

This should delete the `Gemfile.lock` before each build to ensure that the gem
is being tested against the versions specified in the gemspec.

An example `jenkins.sh`:

    #!/bin/sh
    set -e
    rm -f Gemfile.lock
    bundle install --path "${HOME}/bundles/${JOB_NAME}"
    bundle exec rake
    bundle exec rake publish_gem
