module Octopress
  unless defined? Octopress.config
    def self.config
      file = '_octopress.yml'
      if File.exist?(file)
        SafeYAML.load_file(file) || {}
      else
        {}
      end
    end
  end

  module PageDate
    module Configuration
      @jekyll_config = {}

      DEFAULTS = {
        'date_format' => 'ordinal',
        'time_format' => '%-I:%M %P'
      }

      def self.jekyll_config=(config)
        @jekyll_config = config
      end

      # For broader compatibility, also read config from Jekyll
      def self.jekyll_date_config
        @jekyll_config.select { |key,_| DEFAULTS.include? key }
      end
    end

    def self.config
      @config ||= begin
        default = PageDate::Configuration::DEFAULTS
        jekyll = PageDate::Configuration::jekyll_date_config
        octopress = Octopress.config

        config = Jekyll::Utils.deep_merge_hashes(default, jekyll)
        Jekyll::Utils.deep_merge_hashes(config, octopress)
      end
    end
  end
end

