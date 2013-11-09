## CSS Coding Style

-   Use comments to divide and clarify what groups of declarations are for

-   Dimensions: use ems to 2 decimal places to [support IE6 and 7](http://destination-code.blogspot.co.uk/2008/10/font-size-relative-length-unit-em.html)

-   Use soft-tabs with a two space indent.

-   When declaring bleeding edge new features, make sure to use browser prefixes, and that the 'final' proposed attribute name is declared last

    For example:

    ```css
    -moz-border-radius: xx;
    -webkit-border-radius: xx;
    border-radius: xx;
    ```

    Before using any such features, check there isn't an existing mixin for it in the [govuk_frontend_toolkit](https://github.com/alphagov/govuk_frontend_toolkit/blob/master/stylesheets/_css3.scss). If there isn't one, consider adding it in the existing style.
