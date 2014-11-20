# Basic security for web applications

For a good quick overview, see [the OWASP Top 10 list](https://www.owasp.org/index.php/Category:OWASP_Top_Ten_Project#tab=OWASP_Top_10_for_2013). Basically, don’t trust user input.

## Rails-specific guidance

- Don't construct HTML using strings in Ruby classes - always construct it in Views or using builders to ensure output is appropriately escaped
- Don't call `to_sym` on strings - this can lead to memory exhaustion
- Turn off YAML and XML request serialisation - this is a major source of attacks and bugs
- Always use ActiveRecord instead of raw SQL to query things
