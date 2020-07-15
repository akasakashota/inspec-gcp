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

title "Test GCP google_project_service resource."

gcp_project_id = attribute(:gcp_project_id, default: "gcp_project_id", description: "The GCP project identifier.")
service = attribute("service", default: {
  "name": "maps-android-backend.googleapis.com",
}, description: "Service description")
control "google_project_service-1.0" do
  impact 1.0
  title "google_project_service resource test"

  describe google_project_service(project: gcp_project_id, name: service["name"]) do
    it { should exist }
    its("state") { should cmp "ENABLED" }
  end
end
