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
class ComputeBackendServices < GcpResourceBase
  name "google_compute_backend_services"
  desc "BackendService plural resource"
  supports platform: "gcp"

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:affinity_cookie_ttl_secs, field: :affinity_cookie_ttl_sec)
  filter_table_config.add(:backends, field: :backends)
  filter_table_config.add(:cdn_policies, field: :cdn_policy)
  filter_table_config.add(:connection_drainings, field: :connection_draining)
  filter_table_config.add(:creation_timestamps, field: :creation_timestamp)
  filter_table_config.add(:fingerprints, field: :fingerprint)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:enable_cdns, field: :enable_cdn)
  filter_table_config.add(:health_checks, field: :health_checks)
  filter_table_config.add(:ids, field: :id)
  filter_table_config.add(:iaps, field: :iap)
  filter_table_config.add(:load_balancing_schemes, field: :load_balancing_scheme)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:port_names, field: :port_name)
  filter_table_config.add(:protocols, field: :protocol)
  filter_table_config.add(:security_policies, field: :security_policy)
  filter_table_config.add(:session_affinities, field: :session_affinity)
  filter_table_config.add(:timeout_secs, field: :timeout_sec)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource("items")
  end

  def fetch_wrapped_resource(wrap_path)
    # fetch_resource returns an array of responses (to handle pagination)
    result = @connection.fetch_all(product_url, resource_base_url, @params, "Get")
    return if result.nil?

    # Conversion of string -> object hash to symbol -> object hash that InSpec needs
    converted = []
    result.each do |response|
      next if response.nil? || !response.key?(wrap_path)

      response[wrap_path].each do |hash|
        hash_with_symbols = {}
        hash.each_key do |key|
          name, value = transform(key, hash)
          hash_with_symbols[name] = value
        end
        converted.push(hash_with_symbols)
      end
    end

    converted
  end

  def transform(key, value)
    return transformers[key].call(value) if transformers.key?(key)

    [key.to_sym, value]
  end

  def transformers
    {
      "affinityCookieTtlSec" => ->(obj) { return :affinity_cookie_ttl_sec, obj["affinityCookieTtlSec"] },
      "backends" => ->(obj) { return :backends, GoogleInSpec::Compute::Property::BackendServiceBackendsArray.parse(obj["backends"], to_s) },
      "cdnPolicy" => ->(obj) { return :cdn_policy, GoogleInSpec::Compute::Property::BackendServiceCdnPolicy.new(obj["cdnPolicy"], to_s) },
      "connectionDraining" => ->(obj) { return :connection_draining, GoogleInSpec::Compute::Property::BackendServiceConnectionDraining.new(obj["connectionDraining"], to_s) },
      "creationTimestamp" => ->(obj) { return :creation_timestamp, parse_time_string(obj["creationTimestamp"]) },
      "fingerprint" => ->(obj) { return :fingerprint, obj["fingerprint"] },
      "description" => ->(obj) { return :description, obj["description"] },
      "enableCDN" => ->(obj) { return :enable_cdn, obj["enableCDN"] },
      "healthChecks" => ->(obj) { return :health_checks, obj["healthChecks"] },
      "id" => ->(obj) { return :id, obj["id"] },
      "iap" => ->(obj) { return :iap, GoogleInSpec::Compute::Property::BackendServiceIap.new(obj["iap"], to_s) },
      "loadBalancingScheme" => ->(obj) { return :load_balancing_scheme, obj["loadBalancingScheme"] },
      "name" => ->(obj) { return :name, obj["name"] },
      "portName" => ->(obj) { return :port_name, obj["portName"] },
      "protocol" => ->(obj) { return :protocol, obj["protocol"] },
      "securityPolicy" => ->(obj) { return :security_policy, obj["securityPolicy"] },
      "sessionAffinity" => ->(obj) { return :session_affinity, obj["sessionAffinity"] },
      "timeoutSec" => ->(obj) { return :timeout_sec, obj["timeoutSec"] },
    }
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def identifiers
    params = %w{project name}

    result = []
    @table.each do |item|
      combo = item.merge(@params)
      item_identifiers = {}
      params.each do |param|
        item_identifiers[param.to_sym] = combo[param.to_sym]
      end
      result.push(item_identifiers)
    end
    result
  end

  private

  def product_url
    "https://www.googleapis.com/compute/v1/"
  end

  def resource_base_url
    "projects/{{project}}/global/backendServices"
  end
end
