.PHONY:	all clean

all:	ruby-interpolated.html

ruby.html: ruby.md
	pandoc -s -f markdown -t html -o ruby.html ruby.md

ruby-interpolated.html: ruby.html syntax.css
	premailer --css syntax.css < ruby.html > ruby-interpolated.html

clean:
	rm -f *.html
