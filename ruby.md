# Ruby coding style

Code is read much more often than it is written. The guidelines provided here
are intended to improve the readability of Ruby code and make it consistent
across the wide spectrum of GDS projects.

A style guide is about consistency. Consistency with this style guide is
important. Consistency within a project is more important. Consistency within
one module or function is most important.

But most importantly: know when to be inconsistent -- sometimes the style guide
just doesn't apply. When in doubt, use your best judgment. Look at other
examples and decide what looks best. And don't hesitate to ask!

Some good reasons to ignore a particular guideline:

1. When applying the guideline would make the code less readable, even for
   someone who is used to reading code that follows this styleguide.
2. To be consistent with surrounding code that also breaks it (maybe for
   historic reasons) -- although this is also an opportunity to clean up the
   existing code.
3. Because the code in question predates the introduction of the guideline and
   there is no other reason to be modifying that code.
4. When the code needs to remain compatible with older versions of Ruby that
   don't support the feature recommended by the style guide.

The rules in this guide are annotated with their corresponding automated validators in Rubocop. Please see [using-rubocop](using-rubocop.md) for more information.

## General

-   Write for Ruby 1.9.

-   Use soft-tabs with a two-space indent. (*Tab,IndentationWidth,IndentationConsistency,BlockAlignment,ElseLayout,EndAlignment*)

-   Keep lines fewer than 80 characters. (*LineLength*)

-   Never leave trailing whitespace, except: (*TrailingWhitespace,EmptyLines,EndOfLine*)

-   Always leave a trailing newline in the file to keep compatibility with
    command-line tools. Some text editors will add this automatically;
    Sublime Text will add it if you enable the
    [`ensure_newline_at_eof_on_save`][newline-eof] setting. (*TrailingBlankLines*)

[newline-eof]: http://sublime-text-unofficial-documentation.readthedocs.org/en/latest/reference/settings.html#automatic-behavior

-   Use spaces around operators, after commas, colons and semicolons,
    around `{` and before `}`. (*SpaceAroundOperators, SpaceBeforeBlockBraces, SpaceAfterSemicolon, SpaceAfterColon, SpaceAfterComma*)

    ```ruby
    sum = 1 + 2
    a, b = 1, 2
    1 > 2 ? true : false; puts "Hi"
    [1, 2, 3].each { |e| puts e }
    ```

-   No spaces after `(`, `[` or before `]`, `)`. (*SpaceInsideBrackets,SpaceInsideParens*)

    ```ruby
    some(arg).other
    [1, 2, 3].length
    ```

-   Indent `when` as deep as `case`. (*CaseIndentation*)

    ```ruby
    case
    when song.name == "Misty"
      puts "Not again!"
    when song.duration > 120
      puts "Too long!"
    when Time.now.hour > 21
      puts "It’s too late"
    else
      song.play
    end

    kind = case year
           when 1850..1889 then "Blues"
           when 1890..1909 then "Ragtime"
           when 1910..1929 then "New Orleans Jazz"
           when 1930..1939 then "Swing"
           when 1940..1950 then "Bebop"
           else "Jazz"
           end
    ```

-   Use empty lines between `def`s and to break up a method into logical
    paragraphs. (*EmptyLineBetweenDefs*)

    ```ruby
    def some_method
      data = initialize(options)

      data.manipulate!

      data.result
    end

    def some_method
      result
    end
    ```

## Gemfile

-   Where a gem is trusted to follow [semantic versioning](http://semver.org/),
    (i.e. the maintainer of the gem is trusted not to break functionality in
    minor or patch releases), use pessimistic version locking in your Gemfile,
    e.g.

    ```gem "json", "~> 1.8.1"```

    not

    ```gem "json", "1.8.1"```

    This makes it easier for Bundler to resolve inter-gem dependencies and also
    makes it easier to update gems to be their latest patch release without
    having to manually bump versions numbers in your Gemfile.

-   If the gem is not trusted to follow semantic versioning, or needs to be
    locked to a specific release, use exact versioning, e.g.

    ```gem "rails", "3.2.18"```

-   Framework gems (e.g. Rails, Sinatra) will almost always want to be locked
    to a specific version as frameworks are especially likely to introduce
    breaking changes in new releases. They should be updated manually as and
    when it is required and/or appropriate.

-   When you need to include an unreleased gem in your Gemfile, always lock it
    to a tag or specific commit, e.g.

    ```gem 'globalize3', github: 'globalize/globalize', ref: 'ab69160ad'```

-   See [A Healthy Bundle](http://robots.thoughtbot.com/a-healthy-bundle) for
    more details on when to use exact and pessimistic versioning.

## Syntax

-   Use `def` with parentheses when there are arguments. Omit the
    parentheses when the method doesn’t accept any arguments. (*DefWithParentheses,MethodCallParentheses*)

    ```ruby
    def some_method
      # body omitted
    end

    def some_method_with_arguments(arg1, arg2)
      # body omitted
    end
    ```

-   Never use `for`. This includes in templates. Use iterators instead. (*For*)

    ```ruby
    arr = [1, 2, 3]

    # bad
    for elem in arr do
      puts elem
    end

    # good
    arr.each do |elem|
      puts elem
    end
    ```

-   Never use `then` for multi-line `if/unless`. (*MultilineIfThen*)

    ```ruby
    # bad
    if some_condition then
      # body omitted
    end

    # good
    if some_condition
      # body omitted
    end
    ```

-   Avoid the ternary operator (`?:`) except in cases where all
    expressions are extremely trivial. However, do use the ternary
    operator(`?:`) over `if/then/else/end` constructs for single line
    conditionals. (*OneLineConditional*)

    ```ruby
    # bad
    result = if some_condition then something else something_else end

    # good
    result = some_condition ? something : something_else
    ```

-   Use one expression per branch in a ternary operator. This also means
    that ternary operators must not be nested. Prefer `if/else`
    constructs in these cases. (*NestedTernaryOperator*)

    ```ruby
    # bad
    some_condition ? (nested_condition ? nested_something : nested_something_else) : something_else

    # good
    if some_condition
      nested_condition ? nested_something : nested_something_else
    else
      something_else
    end
    ```

-   Always use `&&` and `||` for logic. The `and` and `or` keywords should be
    used only for control flow, and only in simple cases. (*AndOr*)

    ```ruby
    def some_method
      save_changes or raise "Cthulhu fhtagn"
      do_something_else
    end
    ```

    Do not use `and`/`or` if the left-hand side of the expression is more
    complicated than a simple method call. Consider in the case above
    whether the exception could better be handled in save_changes.

    [Explanation of the difference between `&&` and `and`](http://blog.tinfoilsecurity.com/ruby-demystified-and-vs)

-   Avoid multi-line `?:` (the ternary operator), use `if/unless`
    instead.(*MultilineTernaryOperator*)

-   Favor modifier `if/unless` usage when you have a single-line body. (*IfUnlessModifier*)

    ```ruby
    # bad
    if some_condition
      do_something
    end

    # good
    do_something if some_condition
    ```

-   Never use `unless` with `else`. Rewrite these with the positive case
    first. (*UnlessElse*)

    ```ruby
    # bad
    unless success?
      puts "failure"
    else
      puts "success"
    end

    # good
    if success?
      puts "success"
    else
      puts "failure"
    end
    ```

-   Don’t use parentheses around the condition of an `if/unless/while`,
    unless the condition contains an assignment (see "Using the return
    value of `=`" below). (*ParenthesesAroundCondition*)

    ```ruby
    # bad
    if (x > 10)
      # body omitted
    end

    # good
    if x > 10
      # body omitted
    end

    # ok
    if (x = self.next_value)
      # body omitted
    end
    ```

-   Use single-letter variables with *extreme* caution. These are sometimes ok
    in single-line blocks when the line itself explains what the variable is
    for, but never in multi-line blocks or where the context isn't entirely
    clear. If in any doubt, give your variables descriptive names.

    ```ruby
    # ok
    result_links = results.map { |r| r["link"] }

    # bad
    big_data = data.map { |k,v| v * 2 }

    # bad
    (1..10).each do |i|
      # things
    end
    ```

-   Never chain `do...end`. (*MethodCalledOnDoEndBlock, MultilineBlockChain*)

    ```ruby
    names = ["Bozhidar", "Steve", "Sarah"]

    # bad
    names.select do |name|
      name.start_with?("S")
    end.map(&:upcase)

    # good
    names.select { |name| name.start_with?("S") }.map(&:upcase)
    ```

    Wrap long functional-style blocks after the `{ |var|`:

    ```ruby
    names.map { |name|
      name.upcase.gsub(/ /, "_")
    }
    ```

    Prefer method extraction to chaining several multiline blocks.

-   Use `Symbol#to_proc` where possible. It’s terser and eliminates
    variable name noise.

    ```ruby
    # bad
    names.map { |n| n.upcase }

    # good
    names.map(&:upcase)
    ```

-   Avoid `return` where not required. (*RedundantReturn*)

    ```ruby
    # bad
    def some_method(some_arr)
      return some_arr.size
    end

    # good
    def some_method(some_arr)
      some_arr.size
    end
    ```

-   Use spaces around the `=` operator when assigning default values to
    method parameters: (*SpaceAroundEqualsInParameterDefault*)

    ```ruby
    # bad
    def some_method(arg1=:default, arg2=nil, arg3=[])
      # do something...
    end

    # good
    def some_method(arg1 = :default, arg2 = nil, arg3 = [])
      # do something...
    end
    ```

    While several Ruby books suggest the first style, the second is much
    more prominent in practice (and arguably a bit more readable).

-   Using the return value of `=` (an assignment) is ok, but surround
    the assignment with parenthesis.

    ```ruby
    # good - shows intented use of assignment
    if (v = array.grep(/foo/)) ...

    # bad
    if v = array.grep(/foo/) ...

    # also good - shows intended use of assignment and has correct precedence.
    if (v = self.next_value) == "hello" ...
    ```

-   Use `||=` freely to initialize variables.

    ```ruby
    # set name to Bozhidar, only if it’s nil or false
    name ||= "Bozhidar"
    ```

-   Don’t use `||=` to initialize boolean variables. (Consider what
    would happen if the current value happened to be `false`.)

    ```ruby
    # bad - would set enabled to true even if it was false
    enabled ||= true

    # good
    enabled = true if enabled.nil?
    ```

-   Avoid using Perl-style special variables (like `$0-9`, `$`, etc. ).
    They are quite cryptic and their use in anything but one-liner
    scripts is discouraged. Prefer long form versions such as
    `$PROGRAM_NAME`.

-   Never put a space between a method name and the opening parenthesis. (*SpaceAfterMethodName*)

    ```ruby
    # bad
    f (3 + 2) + 1

    # good
    f(3 + 2) + 1
    ```

-   If the first argument to a method begins with an open parenthesis,
    always use parentheses in the method invocation. For example, write
    `f((3 + 2) + 1)`.

-   Use `_` for unused block parameters. (*UnusedBlockArgument*)

    ```ruby
    # bad
    result = hash.map { |k, v| v + 1 }

    # good
    result = hash.map { |_, v| v + 1 }
    ```

## Naming

-   Use `snake_case` for methods and variables. (*VariableName, MethodName*)

-   Use `CamelCase` for classes and modules. (Keep acronyms like HTTP,
    RFC, XML uppercase.) (*ClassAndModuleCamelCase*)

-   Use `SCREAMING_SNAKE_CASE` for other constants. (*ConstantName*)

-   The names of predicate methods (methods that return a boolean value)
    should end in a question mark. (i.e. `Array#empty?`).

-   The names of potentially "dangerous" methods (i.e. methods that
    modify `self` or the arguments, `exit!`, etc.) should end with an
    exclamation mark. Bang methods should only exist if a non-bang
    method exists. ([More on
    this](http://dablog.rubypal.com/2007/8/15/bang-methods-or-danger-will-rubyist)).

-   Avoid get/set method names: these are better implemented using Ruby's
    assignment syntax sugar. Use `attr_reader`, `attr_writer`, and
    `attr_accessor` for simple instance variable accessors. (*TrivialAccessors*)

    ```ruby
    # bad
    def get_foo
      # ...
    end

    def set_foo(bar)
      # ...
    end

    # good
    def foo
      # ...
    end

    def foo=(bar)
      # ...
    end
    ```

## Classes

-   Avoid the usage of class (`@@`) variables due to their "nasty"
    behavior in inheritance. (*ClassVars*)

    ```ruby
    class Parent
      @@class_var = "parent"

      def self.print_class_var
        puts @@class_var
      end
    end

    class Child < Parent
      @@class_var = "child"
    end

    Parent.print_class_var # => will print "child"
    ```

    As you can see all the classes in a class hierarchy actually share
    one class variable. Class instance variables should usually be
    preferred over class variables.

-   Use `def self.method` to define singleton methods. This makes the
    methods more resistant to refactoring changes. (*ClassMethods*)

    ```ruby
    class TestClass
      # bad
      def TestClass.some_method
        # body omitted
      end

      # good
      def self.some_other_method
        # body omitted
      end
    end
    ```

-   Avoid `class << self` except when necessary, e.g. single accessors
    and aliased attributes.

    ```ruby
    class TestClass
      # bad
      class << self
        def first_method
          # body omitted
        end

        def second_method_etc
          # body omitted
        end
      end

      # good
      class << self
        attr_accessor :per_page
        alias_method :nwo, :find_by_name_with_owner
      end

      def self.first_method
        # body omitted
      end

      def self.second_method_etc
        # body omitted
      end
    end
    ```

-   Indent `public`, `protected`, and `private` methods to the same level as
    the rest of the methods. Outdent `private` etc. to the same level as
    `class`, and leave one blank line before, none after. Outdenting these from
    the method definitions helps them to stand out (syntax highlighting seems
    to be unreliable in this case). Keeping private methods at the same depth
    as other methods avoids complicating diffs.

    ```ruby
    class SomeClass
      def public_method
        # ...
      end

    private
      def private_method
        # ...
      end
    end
    ```

## Exceptions

-   Don’t use exceptions for flow of control.

    ```ruby
    # bad
    begin
      n / d
    rescue ZeroDivisionError
      puts "Cannot divide by 0!"
    end

    # good
    if d.zero?
      puts "Cannot divide by 0!"
    else
      n / d
    end
    ```

-   Avoid rescuing the `Exception` class. (*RescueException*)

    ```ruby
    # bad
    begin
      # an exception occurs here
    rescue
      # exception handling
    end

    # still bad
    begin
      # an exception occurs here
    rescue Exception
      # exception handling
    end
    ```

## Collections

-   Prefer `%w` to the literal array syntax when you need an array of
    strings. (*WordArray*)

    ```ruby
    # bad
    STATES = ["draft", "open", "closed"]

    # good
    STATES = %w(draft open closed)
    ```

-   Instead of wrapping a long list of array elements to a newline, write
    one element per line. This enhances readability and helps generate
    clearer diffs. (*AlignArray*)

    ```ruby
    # bad
    ACTIONS = %w(create_new request_approval approve second_approval
                publish archive)

    # good
    ACTIONS = %w(
        create_new
        request_approval
        approve
        second_approval
        publish
        archive
    )
    ```

-   Use `Set` instead of `Array` when dealing with unique elements.
    `Set` implements a collection of unordered values with no
    duplicates. This is a hybrid of `Array`’s intuitive inter-operation
    facilities and `Hash`’s fast lookup.

-   Prefer symbols instead of strings for hashes generated and consumed
    within the application.

    ```ruby
    # bad
    hash = {"one" => 1, "two" => 2, "three" => 3}

    # good
    hash = {one: 1, two: 2, three: 3}
    ```

- Use Ruby 1.9 syntax for symbolic hash keys. This includes method calls. (*HashSyntax*)

    ```ruby
    # bad
    hash = {:one => 1, :two => 2}

    # good
    hash = {one: 1, two: 2}

    # bad
    some_method :one => 1, :two => 2

    # good
    some_method one: 1, two: 2
    ```

- Add a trailing comma to multi-line array and hash definitions
  for clearer diffs with less line noise. (*TrailingComma*)

  ```ruby
    # bad
    hash = {
      one: 1,
      two: 2
    }

    # good
    hash = {
      one: 1,
      two: 2,
    }

    # bad
    array = [
      :one,
      :two
    ]

    # good
    array = [
      :one,
      :two,
    ]

  ```

## Strings

-   Prefer string interpolation instead of string concatenation: (*StringConversionInInterpolation*)

    ```ruby
    # bad
    email_with_name = user.name + " <" + user.email + ">"

    # good
    email_with_name = "#{user.name} <#{user.email}>"
    ```

-   Try not to mix up single-quoted and double-quoted strings within a file:
    it can make the code harder to read. *Definitely* don't mix up single-quoted
    and double-quoted strings within a method. If in doubt, use double-quoted
    strings, because you’ll probably need to use interpolation somewhere. (*StringLiterals*)

-   Avoid using `String#+` when you need to construct large data chunks.
    Instead, use `String#<<`. Concatenation mutates the string instance
    in-place and is always faster than `String#+`, which creates a bunch
    of new string objects.

    ```ruby
    # good and also fast
    html = ""
    html << "<h1>Page title</h1>"

    paragraphs.each do |paragraph|
      html << "<p>#{paragraph}</p>"
    end
    ```

## Regular Expressions

-   Avoid using $1-9 as it can be hard to track what they contain. Named
    groups can be used instead.

    ```ruby
    # bad
    /(regexp)/ =~ string
    ...
    process $1

    # good
    /(?<meaningful_var>regexp)/ =~ string
    ...
    process meaningful_var
    ```

-   Be careful with `^` and `$` as they match start/end of line, not
    string endings. If you want to match the whole string use: `\A` and
    `\z`.

    ```ruby
    string = "some injection\nusername"
    string[/^username$/]   # matches
    string[/\Ausername\z/] # don’t match
    ```

-   Use `x` modifier for complex regexps. This makes them more readable
    and you can add some useful comments. Just be careful as spaces are
    ignored.

    ```ruby
    regexp = %r{
      start         # some text
      \s            # white space char
      (group)       # first group
      (?:alt1|alt2) # some alternation
      end
    }x
    ```

## Percent Literals

-   Use `%w` freely.

    ```ruby
    STATES = %w(draft open closed)
    ```

-   Use `%()` for single-line strings which require both interpolation
    and embedded double-quotes. For multi-line strings, prefer heredocs.

    ```ruby
    # bad (no interpolation needed)
    %(<div class="text">Some text</div>)
    # should be '<div class="text">Some text</div>'

    # bad (no double-quotes)
    %(This is #{quality} style)
    # should be "This is #{quality} style"

    # bad (multiple lines)
    %(<div>\n<span class="big">#{exclamation}</span>\n</div>)
    # should be a heredoc.

    # good (requires interpolation, has quotes, single line)
    %(<tr><td class="name">#{name}</td>)
    ```

-   Use `%r` only for regular expressions matching *more than* one "/"
    character, or where `//` expressions would be parsed as `/` operations.

    ```ruby
    # bad
    %r(\s+)

    # still bad
    %r(^/(.*)$)
    # should be /^\/(.*)$/

    # good
    %r(^/blog/2011/(.*)$)
    ```
