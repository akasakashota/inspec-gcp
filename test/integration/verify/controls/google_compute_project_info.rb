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

title "Test GCP google_compute_project_info resource."

gcp_project_id = attribute(:gcp_project_id, default: "gcp_project_id", description: "The GCP project identifier.")
control "google_compute_project_info-1.0" do
  impact 1.0
  title "google_compute_project_info resource test"

  describe google_compute_project_info(project: gcp_project_id) do
    it { should exist }
    its("default_service_account") { should match "developer.gserviceaccount.com" }
  end
end
