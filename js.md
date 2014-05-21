# JavaScript coding style

## Contents

* [Whitespace](#whitespace)
* [CoffeeScript](#coffeescript)
* [HTML class hooks](#html-class-hooks)
* [Styling elements](#styling-elements)
* [Strict mode](#strict-mode)
* [Chaining](#chaining)
* [jQuery](#jquery)
* [Let the project define the style](#let-the-project-define-the-style)

## Whitespace

Use soft tabs with a two space indent.

**Why:** This follows the conventions used within our other projects.

## CoffeeScript

Don't use CoffeeScript.

**Why:** It's an extra abstraction and introduces another
language for developers to learn. Using JavaScript gives us guaranteed
performance characteristics and more well known support paths.

## HTML class hooks

When attaching JavaScript to the DOM use a `.js-` prefix for the HTML classes.

Eg `js-hidden` or `js-tab`.

**Why:** This makes it completely transparent what the class is used for within
the HTML. It also makes it much easier to search in a project to remove old
behaviour.

## Styling elements

Don't apply styles directly inside JavaScript. You should only ever apply CSS
classes and style from there.

**Why:** This reduces the risk of clobbering user stylesheets and mixing
concerns across different code bases. Also see [HTML class
hooks](#html-class-hooks).

## Strict mode

You should add the `"use strict";` statement to the top of your module functions.

**Why:** This enables [strict
mode](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions_and_function_scope/Strict_mode).
Strict mode converts many mistakes, such as undefined varaibles, into errors
which makes it easier to determine why things aren't working. It also forces
scope so you don't accidently export globals.

## Chaining

Avoid creating long method chains.

```javascript
// Bad
$('.something').find('.something-else').next('label').addClass('clickable').mousedown(doMousedownThing).click(doClickThing).click();

// Good
var $label = $('.something .something-else').next('label');

$label.addClass('clickable');
$label.mousedown(doMousedownthing);
$label.click(doClickThing);
doSomething();
```

**Why:** Long chains can be hard to understand for people who haven't read the
code before. This can cause people to misunderstand what a line is doing.

## jQuery

* Prefix jQuery objects with a `$`.

  ```javascript
  // Bad
  var list = $('.list');

  //Good
  var $list = $('.list');
  ```

  **Why:** for clarity between normal DOM objects and jQuery objects. This is
  especially useful in function arguments as it is obvious a jQuery object needs
  to be passed into that function.

* Cache jQuery objects in varables.

  ```javascript
  // Bad
  $('.list').click(...);
  $('.list').addClass(...);

  // Good
  var $list = $('list');
  $list.click(...);
  $list.addClass(...);
  ```

  **Why:** DOM queries are slow operations, especially if they are complicated.
  By caching the result of a jQuery object in a variable it reduces the number
  of queries you have to perform on the document.

## Let the project define the style

As with most parts of software development, it's better to be consistent than
perfect. If your repository already has a style then follow it.

If you're looking for inspiration, we find the [Airbnb JavaScript style
guide][airbnb-js] to be very sensible.

[airbnb-js]: https://github.com/airbnb/javascript
