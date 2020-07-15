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
require "google/compute/property/backendbucket_cdn_policy"

# A provider to manage Compute Engine resources.
class ComputeBackendBucket < GcpResourceBase
  name "google_compute_backend_bucket"
  desc "BackendBucket"
  supports platform: "gcp"

  attr_reader :params
  attr_reader :bucket_name
  attr_reader :cdn_policy
  attr_reader :creation_timestamp
  attr_reader :description
  attr_reader :enable_cdn
  attr_reader :id
  attr_reader :name

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, "Get")
    parse unless @fetched.nil?
    @params = params
  end

  def parse
    @bucket_name = @fetched["bucketName"]
    @cdn_policy = GoogleInSpec::Compute::Property::BackendBucketCdnPolicy.new(@fetched["cdnPolicy"], to_s)
    @creation_timestamp = parse_time_string(@fetched["creationTimestamp"])
    @description = @fetched["description"]
    @enable_cdn = @fetched["enableCdn"]
    @id = @fetched["id"]
    @name = @fetched["name"]
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "BackendBucket #{@params[:name]}"
  end

  def un_parse
    {
      "bucket_name" => ->(x, _) { x.nil? ? [] : ["its('bucket_name') { should cmp #{x.inspect} }"] },
      "cdn_policy" => ->(x, _) { x.nil? ? [] : GoogleInSpec::Compute::Property::BackendBucketCdnPolicy.un_parse(x, "cdn_policy") },
      "creation_timestamp" => ->(x, _) { x.nil? ? [] : ["its('creation_timestamp.to_s') { should cmp '#{x.inspect}' }"] },
      "description" => ->(x, _) { x.nil? ? [] : ["its('description') { should cmp #{x.inspect} }"] },
      "enable_cdn" => ->(x, _) { x.nil? ? [] : ["its('enable_cdn') { should cmp #{x.inspect} }"] },
      "id" => ->(x, _) { x.nil? ? [] : ["its('id') { should cmp #{x.inspect} }"] },
      "name" => ->(x, _) { x.nil? ? [] : ["its('name') { should cmp #{x.inspect} }"] },
    }
  end

  def dump(path, template_path, test_number, ignored_fields)
    name = "BackendBucket"

    arr = un_parse.map do |k, v|
      next if ignored_fields.include?(k)

      v.call(method(k.to_sym).call, k)
    end
    template_vars = {
      name: name,
      arr: arr,
      type: "google_compute_backend_bucket",
      identifiers: @params,
      number: test_number,
    }
    File.open("#{path}/#{name}_#{test_number}.rb", "w") do |file|
      file.write(ERB.new(File.read(template_path)).result_with_hash(template_vars))
    end
  end

  private

  def product_url
    "https://www.googleapis.com/compute/v1/"
  end

  def resource_base_url
    "projects/{{project}}/global/backendBuckets/{{name}}"
  end
end
