# HTML coding style

## HTML5

* Always quote attribute values - the decision tree for remember when to
  selectively quote is too much mental overhead, so just quote them
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

* `role="main"` maps to the `<main>` element
* `role="complementary"` maps to the `<aside>` element
* `role="contentinfo"` maps to the `<footer>` element
* `role="navigation"` maps to the `<nav>` element

[This article from Léonie Watson](http://tink.uk/screen-readers-aria-roles-html5-support/) explains why using ARIA landmark roles in this way delivers the best experience for screen reader users.

For a more comprehensive guide to the mapping of roles to HTML5 sectioning elements read this [guide](http://blog.paciellogroup.com/2013/02/using-wai-aria-landmarks-2013/) from the Paciello Group.

The following landmark roles don't map to HTML5 elements, but are
still good to use:

* `role="search"`
* `role="application"`

[Demo of how landmark roles help screen reader users](http://tink.co.uk/2011/07/how-do-aria-landmark-roles-help-screen-reader-users/)

## Main content

The `<main>` tag should be used to identify the main content of your page. Support for it is still marginal so ensure to add the `role="main"` attribute.

## Sectioned content

When using the `<section>` tag, add an `aria-labelledby` attribute linking to the id of the heading that identifies that section.

Example:

    <section aria-labelledby="advice">
      <h1 id="advice">Help and advice</h1>

## Navigational elements

When using the `<nav>` tag, add the ARIA landmark `role="navigation"`.

The detail of using the `<nav>` tag is covered in this [blog post](https://insidegovuk.blog.gov.uk/2013/07/03/rethinking-navigation/).

### Emphasis

If you want to give the current location emphasis within a navigational list, use a `<strong>` tag.

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
