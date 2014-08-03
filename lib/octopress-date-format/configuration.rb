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
      DEFAULTS = {
        'date_format' => 'ordinal',
        'time_format' => '%-I:%M %P',
      }
    end

    def self.config
      @config ||= Jekyll::Utils.deep_merge_hashes(PageDate::Configuration::DEFAULTS, Octopress.config)
    end
  end
end

