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

title "Test GCP google_storage_buckets resource."

gcp_project_id = attribute(:gcp_project_id, default: "gcp_project_id", description: "The GCP project identifier.")
gcp_location = attribute(:gcp_location, default: "gcp_location", description: "GCP location")
control "google_storage_buckets-1.0" do
  impact 1.0
  title "google_storage_buckets resource test"

  describe google_storage_buckets(project: gcp_project_id) do
    its("bucket_names") { should include "inspec-gcp-static-#{gcp_project_id}" }
  end
end
