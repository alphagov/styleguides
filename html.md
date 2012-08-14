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

* `role="complementary"` maps to the `<article>` element
* `role="contentinfo"` maps to the `<footer>` element
* `role="navigation"` maps to the `<nav>` element

The following landmark roles don't map to HTML5 elements, but are
still good to use:

* `role="search"`
* `role="main"`
* `role="application"`

[Demo of how landmark roles help screen reader users](http://tink.co.uk/2011/07/how-do-aria-landmark-roles-help-screen-reader-users/)

## Navigational elements

### Emphasis

If you want to give the current location emphasis within a navigational list, use a strong tag. 

Example:

    <nav role="navigation">
      <ol>
        <li><a href="/">Home</a></li>
        <li><a href="/business">Business</a></li>
        <li><strong>Business Rates</strong></li>
      </ol>
    </nav>

It's semantically more accurate to use `<strong>` than `<em>` and this usage is a reasonably common convention.

When following this pattern ensure the text is of reasonable length. Too much text marked up in either tag can become difficult to read in some instances.
