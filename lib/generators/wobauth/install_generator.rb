module Wobauth
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      
      desc "Copy locale files to your application"
      def copy_locale
        ['en', 'de'].each do |lang|
          copy_file "../../../config/locales/#{lang}.yml", 
                    "config/locales/wobauth.#{lang}.yml"
        end
      end

      desc "create initializer"
      def copy_initializer
        copy_file "initializers/wobauth.rb", "config/initializers/wobauth.rb"
      end
    end
  end
end
