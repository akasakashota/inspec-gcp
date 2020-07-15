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
require "gcp_backend"

# A provider to manage App Engine resources.
class AppEngineStandardAppVersion < GcpResourceBase
  name "google_appengine_standard_app_version"
  desc "StandardAppVersion"
  supports platform: "gcp"

  attr_reader :params
  attr_reader :name
  attr_reader :version_id
  attr_reader :runtime
  attr_reader :threadsafe

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, "Get")
    parse unless @fetched.nil?
    @params = params
  end

  def parse
    @name = @fetched["name"]
    @version_id = @fetched["id"]
    @runtime = @fetched["runtime"]
    @threadsafe = @fetched["threadsafe"]
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "StandardAppVersion #{@params[:version_id]}"
  end

  def un_parse
    {
      "name" => ->(x, _) { x.nil? ? [] : ["its('name') { should cmp #{x.inspect} }"] },
      "version_id" => ->(x, _) { x.nil? ? [] : ["its('version_id') { should cmp #{x.inspect} }"] },
      "runtime" => ->(x, _) { x.nil? ? [] : ["its('runtime') { should cmp #{x.inspect} }"] },
      "threadsafe" => ->(x, _) { x.nil? ? [] : ["its('threadsafe') { should cmp #{x.inspect} }"] },
    }
  end

  def dump(path, template_path, test_number, ignored_fields)
    name = "StandardAppVersion"

    arr = un_parse.map do |k, v|
      next if ignored_fields.include?(k)

      v.call(method(k.to_sym).call, k)
    end
    template_vars = {
      name: name,
      arr: arr,
      type: "google_appengine_standard_app_version",
      identifiers: @params,
      number: test_number,
    }
    File.open("#{path}/#{name}_#{test_number}.rb", "w") do |file|
      file.write(ERB.new(File.read(template_path)).result_with_hash(template_vars))
    end
  end

  private

  def product_url
    "https://appengine.googleapis.com/v1/"
  end

  def resource_base_url
    "apps/{{project}}/services/{{service}}/versions/{{version_id}}"
  end
end
