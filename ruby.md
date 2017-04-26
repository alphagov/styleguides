# Ruby coding style

Code is read much more often than it is written. The guidelines provided here
are intended to improve the readability of Ruby code and make it consistent
across the wide spectrum of GDS projects.

A style guide is about consistency. Consistency with this style guide is
important. Consistency within a project is more important. Consistency within
one module or function is most important.

But most importantly: know when to be inconsistent -- sometimes the style guide
just doesn't apply. When in doubt, use your best judgement. Look at other
examples and decide what looks best. And don't hesitate to ask!

Some good reasons to ignore a particular guideline:

1. When applying the guideline would make the code less readable, even for
   someone who is used to reading code that follows this style guide.
2. To be consistent with surrounding code that also breaks it (maybe for
   historic reasons) -- although this is also an opportunity to clean up the
   existing code.
3. Because the code in question predates the introduction of the guideline and
   there is no other reason to be modifying that code.
4. When the code needs to remain compatible with older versions of Ruby that
   don't support the feature recommended by the style guide.

Our styleguide is enforced using [govuk-lint](using-rubocop.md), a wrapper around
Rubocop. You can find the enabled and disabled rules in the [govuk-lint repo][govuk-lint-rules].

[govuk-lint-rules]: https://github.com/alphagov/govuk-lint/tree/master/configs/rubocop
