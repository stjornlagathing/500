# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.gem 'will_paginate', :version => '~> 2.3.11', :source => 'http://gemcutter.org'
  config.gem 'alea', :lib => "alea" 
  config.time_zone = 'UTC'

  #config.i18n.default_locale = :is
end

JANRAIN_API = "a0400ba6820a8589365e69f421e88d6cde02b0a5"