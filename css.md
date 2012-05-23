## CSS Coding Style

-   Put attributes for elements in alphabetical order

-   Use comments to divide and clarify what groups of declarations are for

-   Font-sizing: use rems with px as a fall-back (this is covered in more detail below) 

-   Use tab size of 2

-   When declaring bleeding edge new features, make sure to use browser prefixes, and that the the 'final' proposed attribute name is declared last

    For example:

    ```css
    -moz-border-radius: xx;
    -webkit-border-radius: xx;
    border-radius: xx;
    ```

## Our friend Internet Explorer

For targeting IE8 and below use a class of 'lte-ie8', then add specific hacks for IE7 with an _ and for IE6 with an *.

For example:

```css
.foo {
  color: black;
}

.lte-ie8 .foo {
  color: green; /* IE8 and older */
  *color: blue; /* IE7 and older */
  _color: red; /* IE6 and older */
}
```

(stolen from http://mathiasbynens.be/notes/safe-css-hacks)


## REM sizing - why?

At the moment the Citizen site uses em-based styles, where the font-sizes are calculated in relation to contextual em-sizing set on parent dom elements. This means that we have to calculate new em-sizes for every different dom context, which has a negative effect on code reuse and design consistency.

To improve this, we're changing the core font-size on the HTML element from 100% to 62.5%, which will allow new styles to utilise simple rem/px font-sizes, e.g.

```css
element {
   font-size: 16px;
   font-size: 1.6rem;
}
```

rems are very similar to ems, except that they ignore dom context entirely and size relative to font-size set on the HMTL element. The px are a fallback for older browsers that don't support rem.

In order to preserve the existing typography, the font-size is boosted back up again on the BODY element (which the rems will ignore).

