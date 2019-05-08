# JavaScript coding style

## Contents

* [Linting](#linting)
* [Whitespace](#whitespace)
* [Naming conventions](#naming-conventions)
* [CoffeeScript](#coffeescript)
* [HTML class hooks](#html-class-hooks)
* [Styling elements](#styling-elements)
* [Strict mode](#strict-mode)
* [Chaining](#chaining)
* [Modules](#modules)
* [Module structure](#module-structure)
* [jQuery](#jquery)
* [Method arguments](#method-arguments)
* [Let the project define the style](#let-the-project-define-the-style)

## Linting

We follow [standardjs](http://standardjs.com/), an opinionated JavaScript linter.
All JavaScript files follow its conventions, and it typically runs on CI to ensure that new pull requests are in line with them.

## Running standard manually

To check the whole codebase, run:

```bash
npm install --global standard
standard
```

### Running standard in your editor

Easier than running standard manually is to install it as a plugin in your editor. This way, it will run automatically while you work, catching errors as they happen on a per-file basis.

There are [official guides for most of the popular editors](http://standardjs.com/index.html#text-editor-plugins).

### Why standard?

Linting rules can be a contentious subject, and a lot of them are down to personal preference. The core idea of standard is to be opinionated and limit the amount of initial bikeshedding discussions around which linting rules to pick, because in the end, it's not as important which rules you pick as it is to just be consistent about it. This is why we chose standard: because we want to be consistent about how we write code, but don't want to spend unnecessary time picking different rules (which all have valid points).

The standard docs have a [complete list of rules and some reasoning behind them](http://standardjs.com/rules.html).

Standard is also [widely used (warning: large file)](https://github.com/feross/standard-packages/blob/master/all.json) (which means community familiarity) and has a [good ecosystem of plugins](http://standardjs.com/awesome.html).

If we decide to move away from it, standard is effectively just a preconfigured bundle of eslint, so it can easily be replaced by switching to a generic `.eslintrc` setup.

## Whitespace

Use soft tabs with a two space indent.

**Why:** This follows the conventions used within our other projects.

## Naming conventions

* Avoid single letter names. Be descriptive with your naming.

  ```javascript
  // Bad
  var n = 'thing'
  function q () { ... }

  // Good
  var name = 'thing'
  function query () { ... }
  ```

  **Why:** Descriptive names help future developers pick up parts of the code
  faster without having to read it all.

* Use camelCase when naming objects, functions, and instances. Use PascalCase
  when naming constructors or classes.

  ```javascript
  // Bad
  var this_is_my_object = {}
  var THISIsMyVariable = 'thing'
  function ThisIsMyFunction() { ... }

  // Good
  var thisIsMyObject = {}
  var thisIsMyVariable = 'thing'
  function thisIsMyFunction() { ... }

  // Bad
  function user (options) {
    this.name = options.name
  }
  var Bob = new user({
    name: 'Bob Parr'
  })

  // Good
  function User(options) {
    this.name = options.name
  }
  var bob = new User({
    name: 'Bob Parr'
  })
  ```

  **Why:** This lets future developers know how to interact with objects and
  sets the appropriate affordances. It also follows the conventions of the
  standard library.

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

You should add the `'use strict'` statement to the top of your module functions.

**Why:** This enables [strict
mode](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions_and_function_scope/Strict_mode).
Strict mode converts many mistakes, such as undefined variables, into errors
which makes it easier to determine why things aren't working. It also forces
scope so you don't accidently export globals.

## Chaining

Avoid creating long method chains.

```javascript
// Bad
$('.something').find('.something-else').next('label').addClass('clickable').mousedown(doMousedownThing).click(doClickThing).click()

// Good
var $label = $('.something .something-else').next('label')

$label.addClass('clickable')
$label.mousedown(doMousedownthing)
$label.click(doClickThing)
doSomething()
```

**Why:** Long chains can be hard to understand for people who haven't read the
code before. This can cause people to misunderstand what a line is doing.

## Modules

Modules should be wrapped in a closure and attach themselves to the global
`GOVUK` object.

```javascript
;(function (global) {
  'use strict'

  var $ = global.jQuery
  var GOVUK = global.GOVUK || {}

  ...

  GOVUK.myModule = ...

  ...

  global.GOVUK = GOVUK
})(window); // eslint-disable-line semi
```

**Why:** attaching to the `GOVUK` object keeps us from polluting the global
namespace. Checking for or creating the `GOVUK` object means the module can
be reused on any project (internal or external) without having to modify it.
You get the benefits of [strict mode](#strict-mode) which include stopping your
module from leaking variables into the global scope.
The [IIFE](https://en.wikipedia.org/wiki/Immediately-invoked_function_expression) should be wrapped with semicolons to ensure no issues with concatenation can happen.

## Module structure

Module logic should be broken down into small testable functions. The functions
should be exposed as methods on the module rather than hidden inside a closure.

```javascript
// Bad
function myModule ($element) {
  function showThing () { ... }
  function hideThing () { ... }
  function submitThing () { ... }
  function getArgumentsForThing () { ... }

  $element.click(submitThing)
}

// Good
function MyModule ($element) {
  $element.click($.bind(this.submitThing, this))
}
MyModule.prototype.showThing = function () { ... }
MyModule.prototype.hideThing = function () { ... }
MyModule.prototype.submitThing = function () { ... }
MyModule.prototype.getArgumentsForThing = function () { ... }

// Good
GOVUK.myModule = {
  showThing: function () { ... },
  hideThing: function () { ... },
  submitThing: function () { ... },
  getArgumentsForThing: function () { ... },
  init: function ($element) {
    $element.click(GOVUK.myModule.submitThing)
  }
}
```

**Why:** Having small well named functions lets developers who are unfamiliar
with the code understand what is going on faster. Having logic in small
functions makes it easier to unit test each of those functions to prove they
performs as expected. Having those functions exposed as methods on the module
makes it possible to test those functions in isolation.

## jQuery

* Prefix jQuery objects with a `$`.

  ```javascript
  // Bad
  var list = $('.list')

  //Good
  var $list = $('.list')
  ```

  **Why:** for clarity between normal DOM objects and jQuery objects. This is
  especially useful in function arguments as it is obvious a jQuery object needs
  to be passed into that function.

* Cache jQuery objects in varables.

  ```javascript
  // Bad
  $('.list').click(...)
  $('.list').addClass(...)

  // Good
  var $list = $('list')
  $list.click(...)
  $list.addClass(...)
  ```

  **Why:** DOM queries are slow operations, especially if they are complicated.
  By caching the result of a jQuery object in a variable it reduces the number
  of queries you have to perform on the document.

## Method arguments

Favour named arguments in a object over sequential arguments.

```javascript
// Bad
function addAutoSubmitToInput (input, action, timeout, debug) { ... }

// Good
function addAutoSubmitToInput (input, options) {
  var action = options.action,
      timeout = options.timeout,
      debug = options.debug
  ...
}
```

**Why:** by using named options you don't necessarily have to read the
internals of the method being called to work out what the arguments mean. Given
a call to `addAutoSubmitToInput($input, './search', 20, false)` you would have
to go to that method to find out what `20` or `false` mean. A call to
`addAutoSubmitToInput($input, { action: './search', timeout: 20, debug: false
})` gives you context as to what the arguments mean. It also makes it
easier to refactor arguments without having to change all method calls.

[Connascence of naming is a weaker form of connascence than connascence of position](http://en.wikipedia.org/wiki/Connascence_%28computer_programming%29#Types_of_connascence).
