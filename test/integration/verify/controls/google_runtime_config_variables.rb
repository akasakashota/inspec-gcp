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

title "Test GCP google_runtime_config_variables resource."

gcp_project_id = attribute(:gcp_project_id, default: "gcp_project_id", description: "The GCP project identifier.")
runtimeconfig_config = attribute("runtimeconfig_config", default: { "name" => "inspec-gcp-runtime-config", "description" => "My runtime configurations" })
runtimeconfig_variable = attribute("runtimeconfig_variable", default: { "name" => "prod-variables/hostname", "text" => "example.com" })

control "google_runtime_config_variables-1.0" do
  impact 1.0
  title "google_runtime_config_variables resource test"

  describe google_runtime_config_variables(project: gcp_project_id, config: runtimeconfig_config["name"]) do
    its("texts") { should include runtimeconfig_variable["text"] }
  end
end
