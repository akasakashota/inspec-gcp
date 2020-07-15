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

title "Test GCP google_project_iam_custom_roles resource."

gcp_project_id = attribute(:gcp_project_id, default: "gcp_project_id", description: "The GCP project identifier.")
gcp_project_iam_custom_role_id = attribute(:gcp_project_iam_custom_role_id, default: "gcp_project_iam_custom_role_id", description: "The IAM custom role identifier.")
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources, default: 0, description: "Flag to enable privileged resources requiring elevated privileges in GCP.")
gcp_organization_id = attribute(:gcp_organization_id, default: gcp_organization_id, description: "The identifier of the organization")
control "google_project_iam_custom_roles-1.0" do
  impact 1.0
  title "google_project_iam_custom_roles resource test"

  only_if { gcp_enable_privileged_resources.to_i == 1 && gcp_organization_id != "" }
  describe google_project_iam_custom_roles(project: gcp_project_id) do
    its("names") { should include "projects/#{gcp_project_id}/roles/#{gcp_project_iam_custom_role_id}" }
  end
end
