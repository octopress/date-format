
module Jekyll
  class DateFormat

    # Returns a datetime if the input is a string
    def self.datetime(date)
      if date.class == String
        date = Time.parse(date)
      end
      date
    end

    # Returns an ordidinal date eg July 22 2007 -> July 22nd 2007
    def self.ordinalize(date)
      date = datetime(date)
      "#{date.strftime('%b')} #{ordinal(date.strftime('%e').to_i)}, #{date.strftime('%Y')}"
    end

    def self.time_tag(date, formatted, type)
      t = "<time class='date-#{type}' datetime='#{date}'"
      t += " pubdate" unless type == 'updated'
      t += ">#{formatted}</time>"
    end


    # Returns an ordinal number. 13 -> 13th, 21 -> 21st etc.
    def self.ordinal(number)
      if (11..13).include?(number.to_i % 100)
        "#{number}<sup>th</sup>"
      else
        case number.to_i % 10
        when 1; "#{number}<sup>st</sup>"
        when 2; "#{number}<sup>nd</sup>"
        when 3; "#{number}<sup>rd</sup>"
        else    "#{number}<sup>th</sup>"
        end
      end
    end

    # Formats date either as ordinal or by given date format
    # Adds %o as ordinal representation of the day
    def self.format_date(date, format)
      date = datetime(date)
      if format.nil? || format.empty? || format == "ordinal"
        date_formatted = ordinalize(date)
      else
        date_formatted = date.strftime(format)
        date_formatted.gsub!(/%o/, ordinal(date.strftime('%e').to_i))
      end
      date_formatted
    end

  end

  class Post

    # Copy the #initialize method to #old_initialize, so we can redefine #initialize
    #
    alias_method :old_initialize, :initialize
    attr_accessor :updated

    def initialize(site, source, dir, name)
      old_initialize(site, source, dir, name)
      format = self.site.config['date_format']

      date_f = DateFormat.format_date(self.date, format) unless self.data['date'].nil?
      date_t = DateFormat.time_tag(self.date, date_f, 'published')

      self.data['date_formatted'] = date_f
      self.data['time_tag'] = date_t

      unless self.data['updated'].nil?
        updated = Time.parse(self.data['updated'].to_s)
        updated_f = DateFormat.format_date(self.data['updated'], format)
        updated_t = DateFormat.time_tag(self.date, date_f, 'updated')

        self.data['updated'] = updated
        self.data['updated_formatted'] = updated_f
        self.data['updated_time_tag'] = updated_t
      end
    end
  end

  class Page

    # Copy the #initialize method to #old_initialize, so we can redefine #initialize
    #
    alias_method :old_initialize, :initialize
    attr_accessor :updated, :date

    def initialize(site, source, dir, name)
      old_initialize(site, source, dir, name)
      format = self.site.config['date_format']

      unless self.data['date'].nil?

        date_f = DateFormat.format_date(self.data['date'], format) unless self.data['date'].nil?
        date_t = DateFormat.time_tag(self.data['date'], date_f, 'published')

        self.data['date_formatted'] = date_f
        self.data['time_tag'] = date_t
      end

      unless self.data['updated'].nil?
        updated = Time.parse(self.data['updated'].to_s)
        updated_f = DateFormat.format_date(self.data['updated'], format)
        updated_t = DateFormat.time_tag(self.date, date_f, 'updated')

        self.data['updated'] = updated
        self.data['updated_formatted'] = updated_f
        self.data['updated_time_tag'] = updated_t
      end
    end
  end
end

