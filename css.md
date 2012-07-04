## CSS Coding Style

-   Group attributes for elements by property type. Separate each group by a blank link. Follow this order where possible: display, positioning, dimensions/box model, text & font styles, colours & decoration.
    
    For example:

    ```css
    .my-selector {
      display: block;
      
      position: relative;
      top: 0;
      left: 2.4em;
      
      width: 40em; height: 60em;
      margin: 0 auto;
      padding: 2em 4em 6em 2em;
      
      font-size: 1.9em;
      line-height: 2.5em;
      text-decoration: underline;
      
      color: #333;
      background-color: #999;
    }

-   Use comments to divide and clarify what groups of declarations are for

-   Dimensions: use ems

-   Use soft-tabs with a two space indent.

-   When declaring bleeding edge new features, make sure to use browser prefixes, and that the 'final' proposed attribute name is declared last

    For example:

    ```css
    -moz-border-radius: xx;
    -webkit-border-radius: xx;
    border-radius: xx;
    ```

## Our friend Internet Explorer

For targeting IE8 and below use a class of `lte-ie8`, then add specific hacks for IE7 with an `*` and for IE6 with an `_`.

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


## REM sizing - why not?

Because [IE6, 7, and 8](http://caniuse.com/rem) don't support them, and mixing pixels with rems to get cross browser support is too much redundant code.
