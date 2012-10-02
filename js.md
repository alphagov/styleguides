# Javascript coding style

## Use soft tabs with a two space indent

This follows the other conventions used within our projects.

## Don't use CoffeeScript

It's an extra abstraction and introduces extra languages for developers to learn. Using Javascript gives us guaranteed performance characteristics and more well known support paths.

## Use a `.js-` prefix for JS-only HTML classes

E.g `js-hidden`, `js-tab` etc. This makes it completely transparent what the class is used for within the HTML.

## Don't apply styles directly inside Javascript

You should only ever apply CSS classes and style from there. Otherwise you risk clobbering user stylesheets and mixing concerns across different code bases. Also see the previous point.
