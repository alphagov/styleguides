##What is Rubocop

Rubocop is an [open-source gem](https://github.com/bbatsov/rubocop) that performs static analysis of Ruby code according to rules that can be granularly configured. Each validation, or rule, is called a "cop". Some of those cops come with the ability to auto-correct issues.

##Recommended usage

Using Rubocop is not compulsory for GDS Ruby projects. It is however highly recommended to enforce at least consistent use of whitespace and indentation.
The GDS-styleguide cops are validated by default and present in the gds-ruby-styleguide.yml configuration. Other validators that may be useful to your project can be found in the three "other-***.yml" files. Choice of cops to use is left to the discretion of your team.

##How to setup Rubocop

- add 'rubocop' to your Gemfile
- copy the content of the "ruby-styleguide" folder from this styleguide to the root of your project
- you will now be able to run ```rubocop``` in your project root folder

##Existing projects

If you have an existing Ruby project that has a number of violations of the GDS styleguide, a way of addressing those issues is:

1) Disable all the cops in the gds-ruby-styleguide that are not annotated with "--auto-correct"

2) Run ```rubocop --auto-correct``` in your project root, check that you are happy with those changes and commit.

3) Enable, one by one, the cops in gds-ruby-styleguide that you wish your project to follow. For each of those, run ```rubocop```, fix the issues, then commit the code fixing that particular set of issues.

4) You may wish to enable extra cops from the other configuration files.

For an example of that process on projects that have been through that transition, please see:
* [business-support-finder](https://github.com/alphagov/business-support-finder/pull/63)
* [calculators](https://github.com/alphagov/calculators/pull/95)
* [calendars](https://github.com/alphagov/calendars/pull/75)

##Jenkins builds

You may wish to use your project's Jenkins build to track whether more violations of the Ruby styleguide are being added to your project.
For an example of how to set that up for a project, please see:
* [specialist-publisher](https://github.com/alphagov/specialist-publisher/pull/111)
