$: << File.expand_path(File.dirname(__FILE__))

require 'active_support/inflector'
ActiveSupport::Inflector.inflections do |inflector|
  inflector.singular 'status', 'status'
end

require 'cq/client'
require 'cq/http_client'
require 'cq/http_error'
require 'cq/request_client'
require 'cq/version'


require 'cq/resources/component'
require 'cq/resources/content'
require 'cq/resources/cq_users'
require 'cq/resources/node'
require 'cq/resources/pages'
