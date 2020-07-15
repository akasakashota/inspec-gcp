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

title "Test GCP google_storage_bucket_object resource."

gcp_project_id = attribute(:gcp_project_id, default: "gcp_project_id", description: "The GCP project identifier.")
gcp_storage_bucket_object = attribute(:gcp_storage_bucket_object, default: "gcp_storage_bucket_object", description: "The name of the storage bucket with an object")
gcp_service_account_display_name = attribute(:gcp_service_account_display_name, default: "gcp_service_account_display_name", description: "The name of the service account assigned permissions")
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources, default: "gcp_enable_privileged_resources", description: "If we are running tests with escalated permissions(required for this test)")
gcp_storage_bucket_object_name = attribute(:gcp_storage_bucket_object_name, default: "gcp_storage_bucket_object_name", description: "The name of the object")
gcp_organization_id = attribute(:gcp_organization_id, default: gcp_organization_id, description: "The identifier of the organization")
control "google_storage_bucket_object-1.0" do
  impact 1.0
  title "google_storage_bucket_object resource test"

  only_if { gcp_enable_privileged_resources.to_i == 1 && gcp_organization_id != "" }
  describe google_storage_bucket_object(bucket: gcp_storage_bucket_object, object: gcp_storage_bucket_object_name) do
    it { should exist }
    its("size.to_i") { should be > 0 }

    its("time_created") { should be > Time.now - 60 * 60 * 24 * 10 }
    its("time_updated") { should be > Time.now - 60 * 60 * 24 * 10 }
  end

  describe google_storage_bucket_object(bucket: gcp_storage_bucket_object, object: "nonexistent") do
    it { should_not exist }
  end
end
