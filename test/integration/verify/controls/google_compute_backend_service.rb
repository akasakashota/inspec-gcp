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

title "Test GCP google_compute_backend_service resource."

gcp_project_id = attribute(:gcp_project_id, default: "gcp_project_id", description: "The GCP project identifier.")
backend_service = attribute("backend_service", default: {
  "name": "inspec-gcp-backend-service",
  "description": "A description",
  "port_name": "http",
  "protocol": "HTTP",
  "timeout_sec": 10,
  "enable_cdn": true,
}, description: "Backend service definition")
control "google_compute_backend_service-1.0" do
  impact 1.0
  title "google_compute_backend_service resource test"

  describe google_compute_backend_service(project: gcp_project_id, name: backend_service["name"]) do
    it { should exist }
    its("description") { should eq backend_service["description"] }
    its("port_name") { should eq backend_service["port_name"] }
    its("protocol") { should eq backend_service["protocol"] }
    its("timeout_sec") { should eq backend_service["timeout_sec"] }
    its("enable_cdn") { should eq backend_service["enable_cdn"] }
  end

  describe google_compute_backend_service(project: gcp_project_id, name: "nonexistent") do
    it { should_not exist }
  end
end
