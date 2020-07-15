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

# A provider to manage Stackdriver Logging resources.
class LoggingOrganizationLogSink < GcpResourceBase
  name "google_logging_organization_log_sink"
  desc "OrganizationLogSink"
  supports platform: "gcp"

  attr_reader :params
  attr_reader :organization
  attr_reader :name
  attr_reader :filter
  attr_reader :destination
  attr_reader :writer_identity
  attr_reader :include_children

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, "Get")
    parse unless @fetched.nil?
    @params = params
  end

  def parse
    @organization = @fetched["organization"]
    @name = @fetched["name"]
    @filter = @fetched["filter"]
    @destination = @fetched["destination"]
    @writer_identity = @fetched["writerIdentity"]
    @include_children = @fetched["includeChildren"]
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "OrganizationLogSink #{@params[:name]}"
  end

  def un_parse
    {
      "organization" => ->(x, _) { x.nil? ? [] : ["its('organization') { should cmp #{x.inspect} }"] },
      "name" => ->(x, _) { x.nil? ? [] : ["its('name') { should cmp #{x.inspect} }"] },
      "filter" => ->(x, _) { x.nil? ? [] : ["its('filter') { should cmp #{x.inspect} }"] },
      "destination" => ->(x, _) { x.nil? ? [] : ["its('destination') { should cmp #{x.inspect} }"] },
      "writer_identity" => ->(x, _) { x.nil? ? [] : ["its('writer_identity') { should cmp #{x.inspect} }"] },
      "include_children" => ->(x, _) { x.nil? ? [] : ["its('include_children') { should cmp #{x.inspect} }"] },
    }
  end

  def dump(path, template_path, test_number, ignored_fields)
    name = "OrganizationLogSink"

    arr = un_parse.map do |k, v|
      next if ignored_fields.include?(k)

      v.call(method(k.to_sym).call, k)
    end
    template_vars = {
      name: name,
      arr: arr,
      type: "google_logging_organization_log_sink",
      identifiers: @params,
      number: test_number,
    }
    File.open("#{path}/#{name}_#{test_number}.rb", "w") do |file|
      file.write(ERB.new(File.read(template_path)).result_with_hash(template_vars))
    end
  end

  private

  def product_url
    "https://logging.googleapis.com/v2/"
  end

  def resource_base_url
    "organizations/{{organization}}/sinks/{{name}}"
  end
end
