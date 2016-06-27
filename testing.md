# Ruby testing

We use RSpec for both unit/integration testing and acceptance testing via RSpec
features.  We discourage too much stubbing in tests with the exception of
external services.

A combination of [RSpec's feature guide](https://www.relishapp.com/rspec/rspec-rails/docs/feature-specs/feature-spec)
and [this Page Object guide](https://robots.thoughtbot.com/better-acceptance-tests-with-page-objects)
should be used in order to keep your RSpec features under control.

Everything you need should be installed and configured if you use the
[GOV.UK Rails templates](https://github.com/alphagov/govuk-rails-app-template).
