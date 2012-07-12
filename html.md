# HTML coding style

## HTML5

* Always quote attribute values - the decision tree for remember when to
  selectively quote is too much mental overhead, so just quote them.
* Always use well-formed HTML - implicitly closed elements such as
  `<p>` cause unnecessary parsing overhead and can cause issues in
  accessibility

## Use ARIA roles appropriately

### Guidance on using ARIA landmarks

When you use HTML5 sectioning elements it's a good idea to include
the appropriate ARIA landmark roles as well. The trick when you're
using both HTML5 and ARIA is to put the landmark on the sectioning
element itself because this avoids the information being duplicated by
screen readers that support both technologies.

Example:

    <header role="banner"></header>


The following roles map directly to HTML5 sectioning elements:

* `role="complimentary"` maps to the `<article>` element
* `role="contentinfo"` maps to the `<footer>` element
* `role="navigation"` maps to the `<nav>` element

The following landmark roles don't map to HTML5 elements, but are
still good to use:

* `role="search"`
* `role="main"`
* `role="application"`

[Demo of how landmark roles help screen reader users](http://tink.co.uk/2011/07/how-do-aria-landmark-roles-help-screen-reader-users/)
