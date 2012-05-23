## CSS Coding Style

-		Put attributes for elements in alphabetical order

-		Use comments to divide and clarify what groups of declarations are for

-		Font-sizing: use rems with px as a fall-back (this is covered in more detail below) 

-		Use tab size of 2

-		When declaring bleeding edge new features, make sure to use browser prefixes, and that the the 'final' proposed attribute name is declared last

For example:

```css
	-moz-border-radius: xx;
	-webkit-border-radius: xx;
	border-radius: xx;

TEST