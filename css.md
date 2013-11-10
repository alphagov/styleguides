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

## REM sizing

Firefox allows users to change the minimum font-size which can effect the font-size specified for the html element, the size that 1 REM is based on. Usage of REMs is often based on the assumption that this will not change so it can cause unexpected results. See this [pull request](https://github.com/alphagov/frontend/pull/385) for details.

If you do use REMs bear in mind they are not supported in IE6, 7 & 8 so you will have to include a pixel value before each REM value for those browsers.

Example:

    font-size: 12px;
    font-size: 1.2rem; /* This line is ignored by IE6, 7 & 8 */
