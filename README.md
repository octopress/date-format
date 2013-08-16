# Jekyll DateFormat

A simple plugin which makes it easy to have nicely formatted dates on any post or page.

## Installation

Add this line to your application's Gemfile:

    gem 'jekyll-date-format'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jekyll-date-format

## Usage

In your Jekyll configuration (usually the _config.yml) you can set the date

| Configuration | Description                                                                    | Default   |
|:--------------|--------------------------------------------------------------------------------|-----------|
| date_format   | A [Ruby strftime](http://apidock.com/ruby/DateTime/strftime) compatible string | 'ordinal' |

Any post (or page with a date) will have access to two new variables. Use `post.date_formatted` to output a date formatted based on your `date_format` Jekyll
configuration, or use `post.time_tag` to output a fully formatted `<time>` tag. For a page, use `page.date_formatted` and `page.time_tag` instead.

```
Published: {{ post.date_formatted }} 
Published: {{ post.time_tag }} 

# Which would output
# Published: July 3, 2013
# Published: <time class='date-published' datetime='2013-07-03 09:08:15 -0500' pubdate>July 3<sup>rd</sup>, 2013</time>
```

In the output above it's worth noting that the `pubdate` attribute is a microformat used to help robots distinguish a document's date of publication.

Additionally if you like to keep track of when posts were updated, you can add an updated  `updated: 2013-07-05 4:08:15` to your post or page's YAML front matter and you'll be able to use variables with your udpated date as well.

```
Last Updated: {{ post.updated_formatted }} 
Last updated: {{ post.time_tag_updated }} 

# Which would output
# Last updated: July 5, 2013
# Last updated: <time class='date-updated' datetime='2013-05-03 04:08:15 -0500'>July 5<sup>th</sup>, 2013</time>
```

Of course you can use Liquid conditionals to test for the presence of `post.updated` before outputting an udpated date.

```
{% if post.updated %}Last Updated: {{ post.time_tag_updated }}{% endif %}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License

Copyright (c) 2013 Brandon Mathis

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
