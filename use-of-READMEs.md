# READMEs for GOV.UK applications

This is a guide to writing and maintaining README documents for GOV.UK's public repositories.

## Who are READMEs for (aka what's the user need)?

- New starters to GDS
- People interested in our work
- Developers on other teams

## Template for new READMEs

```markdown
# App name

One paragraph description and purpose.

## Screenshots (if there's a client facing aspect of it)

## Live examples (if available)

- [gov.uk/thing](https://www.gov.uk/thing)

## Nomenclature

- **Word**: definition of word, and how it's used in the code

## Technical documentation

Document if app is Ruby etc and whether it uses Bundler etc.

### Dependencies

- [alphagov/other-repo]() - provides some downstream service
- [redis]() - provides a primitive

### Running the application

`./one-line-command.sh`

Documentation for where the app will appear (default port, vhost, URL etc).

### Running the test suite

`./one-line-command.sh`

Include any other edge cases, e.g parallel test runner in Whitehall

### Any deviations from idiomatic Rails/Go etc. (optional)

### Example API output (optional)

`one-line-curl-command with json response after`

Keep this section limited to core endpoints - if the app is complex link out to `/docs`.

## Licence

[MIT Licence](LICENCE)

## Versioning policy (for Gems only)

```

## Things this template achieves

- Is consistent
- Is scannable
- Functionality is shown in screenshots and links to live services
- Has quick start information for new developers or interested third parties

## Things we shouldn't put in the README

- Full documentation of the API - if the app is complex or has a complex API, use the `docs` directory liberally, and link out to it from the `README`
	- If the API is small try to keep it in the main README and don't link to docs
	- Some bad examples - too much documentation in the README:
		- [smart-answers](https://github.com/alphagov/smart-answers/blob/06dfeb854ec9728374186a2e37c1eb62a5aaa49a/README.md)
		- [govuk_frontend_toolkit](https://github.com/alphagov/govuk_frontend_toolkit/blob/edd834de8d2f4e854475f5d226aa0cd260795cef/README.md)
	- Good examples:
		- [content-store](https://github.com/alphagov/content-store/blob/b244620f505f248fc93d8556eedad14b5cba1187/README.md) - links out to more docs as required
		- [modern smart-answers](https://github.com/alphagov/smart-answers/blob/c0b4580d18ccc5004abfa7015017d26e1a73f2aa/README.md) - links out to more docs as required
	- For Ruby libraries always use [yardoc](http://yardoc.org/) - then Gems will automatically have docs built
- Contributors - we can use GitHub's native graphing tools for this
- Contribution guidelines - use GitHub's [CONTRIBUTING.md](https://help.github.com/articles/setting-guidelines-for-repository-contributors/) guidelines for this
	- When writing this document, always link to the [GOV.UK pull request styleguide](https://github.com/alphagov/styleguides/blob/master/pull-requests.md)
	- Document any weirdness here (eg when to use Cucumber over something else)
- Full licence - again, follow [GitHub convention](https://help.github.com/articles/open-source-licensing/#where-does-the-license-live-on-my-repository)

## One line summaries on GitHub repositories

Who are these for? These are for people who scan the list in [alphagov](https://github.com/alphagov/) and need a quick overview.

- Include information about whether it's on GOV.UK
- Try and tone down technical language - 'Filtered search of content' is better than 'Faceted search interface'
- Don't use the GitHub link field unless it has a single unchanging URL - better to version public links with the code

A good example:

> GOV.UK filtered search of public content
