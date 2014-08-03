# Octopress Date Format

A simple plugin which makes it easy to have nicely formatted dates on any post or page.

[![Build Status](https://travis-ci.org/octopress/date-format.svg)](https://travis-ci.org/octopress/date-format)
[![Gem Version](http://img.shields.io/gem/v/octopress-date-format.svg)](https://rubygems.org/gems/octopress-date-format)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://octopress.mit-license.org)

## Installation

Add this line to your application's Gemfile:

    gem 'octopress-date-format'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install octopress-date-format

Next add it to your gems list in Jekyll's `_config.yml`

    gems:
      - octopress-date-format
    
## Usage

Any post (or page with a date) will automatically have some new date attributes. 

- `date` - The date, `2014-07-03 14:08:00 +0000`
- `date_text` - The formatted date, Jul 3rd, 2014
- `time_text` - The formatted time, 2:08 pm
- `date_xml` - The XML schema formatted date, 2014-07-03T14:08:00+00:00
- `date_html` - The formatted date in a `<time>` tag.
- `date_time_html` - The formatted date and time in a `<time>` tag.

Here's an example of what would be rendered with `{{ post.date_time_html }}`.

```html
<time class='entry-date' datetime='2014-07-03T14:08:00+00:00'>
  <span class='date'>
    <span class='date-month'>Jul</span>
    <span class='date-day'>3</span><span class='date-suffix'>rd</span>,
    <span class='date-year'>2014</span>
  </span>
  <span class='time'>2:08 pm</span>
</time>
```

If you update a post or page and want to display this in a template, add this to YAML
front-matter, `date_updated: 2014-07-03 15:03:15` and your post will have updated date
attributes as well.

- `updated` - The date, `2014-07-03 15:03:15 +0000`
- `date_updated_text` - The formatted date, Jul 3rd, 2014
- `time_updated_text` - The formatted time, 3:03 pm
- `date_updated_xml` - The XML schema formatted date, 2014-07-03T15:03:15+00:00
- `date_updated_html` - The formatted date in a `<time>` tag.
- `date_time_updated_html` - The formatted date and time in a `<time>` tag.

Of course you can use Liquid conditionals when outputting an updated date.

```
{% if post.updated %}Updated: {{ post.date_time_updated_html }}{% endif %}
```

## Configuration

You may change the formatting of the dates and times in the
`_octopress.yml` configuration file. Here are the defaults:

```
date_format: 'ordinal'     # July 3rd, 2014
time_format: '%-I:%M %P'   # 2:08 pm
```

To choose a different format, use a [Ruby strftime](http://apidock.com/ruby/DateTime/strftime)
compatible string. For example:

```
date_format: "%Y-%m-%d"  # e.g. 2014-07-03
time_format: "%H:%M"     # 24 hour time
```

## Contributing

1. Fork it ( https://github.com/octopress/date-format/fork )
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
