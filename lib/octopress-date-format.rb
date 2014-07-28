module Octopress
  module PageDate
    class PageHook < Hooks::Page
      def post_init(page)
        PageDate.hack_date(page)
      end
    end

    class PostHook < Hooks::Page
      def post_init(page)
        PageDate.hack_date(page)
      end
    end

    def self.hack_date(page)
      if page.data['date'] || page.respond_to?(:date)
        the_date  = datetime(page.data['date'] || page.date)
        text      = format_date(the_date)
        xmlschema = the_date.xmlschema
        html      = date_html(text, xmlschema)

        page.data['date_xml']  = xmlschema
        page.data['date_html'] = html
      end

      if page.data['updated']
        the_date  = datetime(page.data['updated'])
        text      = format_date(the_date)
        xmlschema = the_date.xmlschema
        html      = date_html(text, xmlschema)

        page.data['updated_date_xml']  = xmlschema
        page.data['updated_date_html'] = html
      end
    end

    def self.date_html(text, xmlschema)
      "<time class='entry-date' datetime='#{ xmlschema }' pubdate>#{ text }</time>"
    end

    def self.format_date(date)
      format = Octopress.config['date_format']
      if format == 'ordinal'
        ordinalize(date)
      else
        date.strftime(format)
      end
    end

    # Returns an ordidinal date eg July 22 2007 -> July 22nd 2007
    def self.ordinalize(date)
      d = "<span class='date-month'>#{date.strftime('%b')}</span> "
      d += "<span class='date-day'>#{date.strftime('%-d')}</span>"
      d += "<span class='date-suffix'>#{ordinal_suffix(date)}</span>, "
      d += "<span class='date-year'>#{date.strftime('%Y')}</span>"
    end

    # Returns an ordinal number. 13 -> 13th, 21 -> 21st etc.
    def self.ordinal_suffix(date)
      number = date.strftime('%e').to_i
      if (11..13).include?(number % 100)
        "th"
      else
        case number % 10
        when 1; "st"
        when 2; "nd"
        when 3; "rd"
        else    "th"
        end
      end
    end

    def self.datetime(input)
      case input
      when Time
        input
      when Date
        input
      when String
        Time.parse(input) rescue Time.at(input.to_i)
      when Numeric
        Time.at(input)
      else
        raise "Invalid Date:", "'#{input}' is not a valid datetime."
        exit(1)
      end
    end
  end
end
