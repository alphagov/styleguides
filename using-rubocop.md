# Using Rubocop

## What is Rubocop

Rubocop is an [open-source gem](https://github.com/bbatsov/rubocop) that performs static analysis of Ruby code according to rules that can be granularly configured. Each validation, or rule, is called a "cop". Some of those cops come with the ability to auto-correct issues.

## Recommended usage

Using Rubocop is not compulsory for GDS Ruby projects. It is however highly recommended to enforce at least consistent use of whitespace and indentation.

The [govuk-lint](https://github.com/alphagov/govuk-lint) Gem includes Rubocop and Cops that correspond to the GDS style guide.

## How to setup Rubocop

- add 'govuk-lint' to your Gemfile
- you will now be able to run ```govuk-lint-ruby``` in your project root folder

## Existing projects

If you have an existing Ruby project that has a number of violations of the GDS style guide, a way of addressing those issues is:

1) Run ```govuk-lint-ruby --auto-correct``` in your project root, check that you are happy with those changes and commit.

2) For the remainder of the violations, you'll need to manually fix the issues before committing the code containing those fixes.

## Jenkins builds

The default Jenkins build script will detect if you are using `govuk-lint` and will run it automatically.
