# JavaScript coding style

## Use soft tabs with a two space indent

This follows the conventions used within our other projects.

## Don't use CoffeeScript

It's an extra abstraction and introduces another language for developers to learn. Using JavaScript gives us guaranteed performance characteristics and more well known support paths.

## Use a `.js-` prefix for JavaScript-only HTML classes

Eg `js-hidden` or `js-tab`. This makes it completely transparent what the class is used for within the HTML.

## Don't apply styles directly inside JavaScript

You should only ever apply CSS classes and style from there. Otherwise you risk clobbering user stylesheets and mixing concerns across different code bases. Also see the previous point.

## Strict mode

Add the `"use strict";` statement to the top of your scripts to enable [strict mode](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions_and_function_scope/Strict_mode).

## Let the project define the style

As with most parts of software development, it's better to be consistent than perfect. If your
repository already has a style then follow it.

If you're looking for inspiration, we find the [Airbnb JavaScript style guide][airbnb-js] to be very sensible.

[airbnb-js]: https://github.com/airbnb/javascript
