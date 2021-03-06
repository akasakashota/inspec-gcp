# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------
require 'gcp_backend'

# A provider to manage Runtime Configurator resources.
class RuntimeConfigVariable < GcpResourceBase
  name 'google_runtime_config_variable'
  desc 'Variable'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :value
  attr_reader :text
  attr_reader :name
  attr_reader :config

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @value = @fetched['value']
    @text = @fetched['text']
    @name = @fetched['name']
    @config = @fetched['config']
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Variable #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    'https://runtimeconfig.googleapis.com/v1beta1/'
  end

  def resource_base_url
    'projects/{{project}}/configs/{{config}}/variables/{{name}}'
  end
end
