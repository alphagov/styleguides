## CSS Coding Style

## Contents

* [Whitespace](#whitespace)
* [Dimensions](#dimensions)
* [Bleeding edge features](#bleeding-edge-features)
* [Sass nesting](#sass-nesting)

## Whitespace

Use soft tabs with a two space indent.

**Why:** This follows the conventions used within our other projects.

## Dimensions

* Dimensions for layout should either use the [variables from the
  frontend_toolkit][measurements.scss] or be in pixel values in multiples of `5px`.

  [measurements.scss]: https://github.com/alphagov/govuk_frontend_toolkit/blob/master/stylesheets/_measurements.scss

  ```css
  // Bad
  .block {
    margin: 28px;
  }
  .block {
    padding: 12px 19px;
  }

  // Good
  .block {
    margin: $gutter;
  }
  .block {
    padding: 10px 20px;
  }
  ```

  **Why:** consistent measurements are better at ensuring all elements on the
  page line up in a visually appealing manner. Pixels are used over `em` or `rem`
  because they are consistent and predictable.

* Avoid using rem sizing

  **Why:** Firefox allows users to change the minimum allowed font-size which
  forces the font-size on the `html` element to be at least that minimum. Rem
  sizes are worked out as a multiplier on the `html` elements font-size. Unless
  you are sizing everything in rem units this can cause rems to be much much
  bigger than you are expecting. See this [pull
  request](https://github.com/alphagov/frontend/pull/385) for details.

  If you do use rems bear in mind they are not supported in IE6, 7 & 8 so you
  will have to include a pixel value before each rem value for those browsers.

  ```css
  font-size: 12px;
  font-size: 1.2rem; /* This line is ignored by IE6, 7 & 8 */
  ```


## Bleeding edge features

When using bleeding edge featues which require vendor prefixes use the [mixins
in the frontend_toolkit][css3.scss].

[css3.scss]: https://github.com/alphagov/govuk_frontend_toolkit/blob/master/stylesheets/_css3.scss

```css
.button {
  @include border-radius(5px);
}
```

**Why:** By keeping vendor prefixes in one place we can easily add or update
the vendor prifixed properties in one place. We can also then remove them and
add warnings to let future developers know they can remove the prefixes in the
future when the vendor prefixed versions aren't needed.

## Sass nesting

* Always define parent reference selectors before defining child selectors

  ```sass
  // Bad
  a {
    color: red;

    .span {
      color: blue;
    }

    &:hover {
      color: pink;
    }
  }

  // Good
  a {
    color: red;

    &:hover {
      color: pink;
    }

    .span {
      color: blue;
    }
  }
  ```

  **Why:** by putting parent reference selectors first it keeps the styling for
  that element together. By putting styling for other elements in the middle you
  have to scroll around watching nesting levels to try and figure out what the
  `&` references.

