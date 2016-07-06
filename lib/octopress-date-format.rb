require 'octopress-date-format/version'

module Octopress
  module DateFormat

    class << self
      DEFAULTS = {
        'date_format' => 'ordinal',
        'time_format' => '%-I:%M %P'
      }
      attr_accessor :config

      def config=(config)
        @config = DEFAULTS.merge(config)
      end

      def hack_date(page)
        if page.data['date'] || page.respond_to?(:date)
          date = datetime(page.data['date'] || page.date)

          page.data['date_xml']  = date.xmlschema
          page.data['date_text'] = format_date(date)
          page.data['time_text'] = format_time(date)
          page.data['date_html'] = date_html(date, false)
          page.data['date_time_html'] = date_html(date)
        end

        # Legacy support
        if page.data['updated']
          page.data['date_updated'] = page.data['updated']
        end

        if page.data['date_updated']
          updated  = datetime(page.data['date_updated'])
          page.data['date_updated_xml']  = updated.xmlschema
          page.data['date_updated_text'] = format_date(updated)
          page.data['time_updated_text'] = format_time(updated)
          page.data['date_updated_html'] = date_updated_html(updated, false)
          page.data['date_time_updated_html'] = date_updated_html(updated)
        end
        page
      end

      def date_html(date, time=true)
        tag =  "<time class='entry-date' datetime='#{ date.xmlschema }'>"
        tag += "<span class='date'>#{format_date(date, true)}</span>"
        if time
          tag += " <span class='time'>#{format_time(date)}</span>" if time
        end
        tag += "</time>"
      end

      def date_updated_html(date, time=true)
        date_html(date, time).sub('entry-date','updated')
      end

      def format_date(date, html=false)
        format = self.config['date_format']
        if format == 'ordinal'
          html ? ordinalize_html(date) : ordinalize(date)
        else
          date.strftime(format)
        end
      end

      def format_time(date, html=false)
        format = config['time_format']
        date.strftime(format)
      end

      # Returns an ordidinal date eg July 22 2007 -> July 22nd 2007
      def ordinalize(date)
        "#{date.strftime('%b %-d')}#{ordinal_suffix(date)}, #{date.strftime('%Y')}"
      end

      def ordinalize_html(date)
        d = "<span class='date-month'>#{date.strftime('%b')}</span> "
        d += "<span class='date-day'>#{date.strftime('%-d')}</span>"
        d += "<span class='date-suffix'>#{ordinal_suffix(date)}</span>, "
        d += "<span class='date-year'>#{date.strftime('%Y')}</span>"
      end

      # Returns an ordinal number. 13 -> 13th, 21 -> 21st etc.
      def ordinal_suffix(date)
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

      def datetime(input)
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

    if defined?(Jekyll::Hooks)
      Jekyll::Hooks.register :site, :after_reset do |site|
        DateFormat.config = site.config
      end

      Jekyll::Hooks.register :posts, :pre_render do |item|
        DateFormat.hack_date(item)
      end

      Jekyll::Hooks.register :pages, :post_init do |item|
        DateFormat.hack_date(item)
      end
    else
      require 'octopress-hooks'

      class PageHook < Hooks::Page
        def post_init(page)
          DateFormat.hack_date(page)
        end
      end

      class PostHook < Hooks::Post
        def post_init(post)
          DateFormat.hack_date(post)
        end
      end

      class SiteHook < Hooks::Site
        def pre_read(site)
          DateFormat.config = site.config
        end
      end
    end
  end
end

if defined? Octopress::Docs
  Octopress::Docs.add({
    name:        "Octopress Date Format",
    gem:         "octopress-date-format",
    version:     Octopress::DateFormat::VERSION,
    description: "Put nicely formatted dates on any post or page",
    path:        File.expand_path(File.join(File.dirname(__FILE__), "../")),
    source_url:  "https://github.com/octopress/date-format",
  })
end
