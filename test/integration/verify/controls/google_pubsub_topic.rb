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

title 'Test GCP google_pubsub_topic resource.'

gcp_project_id = attribute(:gcp_gcp_project_id, default: '', description: 'The GCP project identifier.')
topic = attribute('topic', default: {"name"=>"inspec-gcp-topic"})

control 'google_pubsub_topic-1.0' do
  impact 1.0
  title 'google_pubsub_topic resource test'

  describe google_pubsub_topic(project: gcp_project_id, name: topic['name']) do
    it { should exist }
  end
end
