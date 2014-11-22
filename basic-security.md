# Basic security for web applications

For a good quick overview, see [the OWASP Top 10 list](https://www.owasp.org/index.php/Category:OWASP_Top_Ten_Project#tab=OWASP_Top_10_for_2013). Basically, don’t trust user input.

## Rails-specific guidance

- Don't construct HTML using strings in Ruby classes - always do it in the
  view and let Rails automatically escape it for you. If you must do it
  outside the view, make sure it is escaped, for example by using
  `content_tag` or `ERB::Util.html_escape`.
- Don't call `to_sym` on strings - this can lead to memory exhaustion
- Turn off YAML and XML request deserialisation - this is a major source of attacks and bugs. [Here is an example of one such attack](http://blog.codeclimate.com/blog/2013/01/10/rails-remote-code-execution-vulnerability-explained/).
- Use ActiveRecord’s built-in methods and [SQL parameter sanitisation](http://guides.rubyonrails.org/security.html#sql-injection-countermeasures) to avoid SQL injection

It is worth familiarising yourself with the [Ruby on Rails Security Guide](http://guides.rubyonrails.org/security.html).
