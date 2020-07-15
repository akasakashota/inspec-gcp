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

title "Test GCP google_compute_backend_buckets resource."

gcp_project_id = attribute(:gcp_project_id, default: "gcp_project_id", description: "The GCP project identifier.")
gcp_storage_bucket_name = attribute(:gcp_storage_bucket_name, default: "gcp_storage_bucket_name", description: "The GCS bucket name to use for the backend bucket.")
backend_bucket = attribute("backend_bucket", default: {
  "name": "inspec-gcp-backend-bucket",
  "description": "Backend bucket example",
  "enable_cdn": true,
}, description: "Backend bucket definition")
control "google_compute_backend_buckets-1.0" do
  impact 1.0
  title "google_compute_backend_buckets resource test"

  describe google_compute_backend_buckets(project: gcp_project_id, name: backend_bucket["name"]) do
    its("descriptions") { should include backend_bucket["description"] }
  end
end
