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
require "google/resourcemanager/property/organizationpolicy_boolean_policy"
require "google/resourcemanager/property/organizationpolicy_list_policy"

# A provider to manage Resource Manager resources.
class OrganizationPolicy < GcpResourceBase
  name "google_resourcemanager_organization_policy"
  desc "OrganizationPolicy"
  supports platform: "gcp"

  attr_reader :params
  attr_reader :version
  attr_reader :constraint
  attr_reader :update_time
  attr_reader :list_policy
  attr_reader :boolean_policy

  def initialize(opts)
    super(opts)
    @organization_name = opts[:organization_name]
    @constraint = opts[:constraint]
    catch_gcp_errors do
      org_policy_request = Google::Apis::CloudresourcemanagerV1::GetOrgPolicyRequest.new
      org_policy_request.constraint = opts[:constraint]
      @fetched = JSON.parse(@gcp.gcp_project_client.get_organization_org_policy(opts[:organization_name], org_policy_request).to_json)
      parse
    end
  end

  def parse
    @version = @fetched["version"]
    @constraint = @fetched["constraint"]
    @update_time = parse_time_string(@fetched["updateTime"])
    @list_policy = GoogleInSpec::ResourceManager::Property::OrganizationPolicyListPolicy.new(@fetched["listPolicy"], to_s)
    @boolean_policy = GoogleInSpec::ResourceManager::Property::OrganizationPolicyBooleanPolicy.new(@fetched["booleanPolicy"], to_s)
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "OrganizationPolicy #{@organization_name} Constraint #{@constraint}"
  end
end
