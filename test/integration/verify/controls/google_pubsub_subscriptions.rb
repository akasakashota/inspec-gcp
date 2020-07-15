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

title "Test GCP google_pubsub_subscriptions resource."

gcp_project_id = attribute(:gcp_project_id, default: "gcp_project_id", description: "The GCP project identifier.")
subscription = attribute("subscription", default: { "name" => "inspec-gcp-subscription", "ack_deadline_seconds" => 20 })

control "google_pubsub_subscriptions-1.0" do
  impact 1.0
  title "google_pubsub_subscriptions resource test"

  describe google_pubsub_subscriptions(project: gcp_project_id) do
    its("count") { should be >= 1 }
  end

  google_pubsub_subscriptions(project: gcp_project_id).names.each do |subscription_name|
    describe google_pubsub_subscription(project: gcp_project_id, name: subscription_name) do
      it { should exist }
    end
  end
end
