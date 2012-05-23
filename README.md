GDS Style guides
================

To build a syntax-highlighted version for the wiki:

		make

and copy the relevant HTML from `[name]-interpolated.html` into the HTML view
on the Google Sites editor.

Prerequisites
-------------

* Premailer – `gem install premailer`
* Pandoc – this must be compiled with highlighting support. The easiest (though
  not fastest) way to achieve this is to install the Haskell Platform and
  build it with `cabal install pandoc --flags=highlighting`
