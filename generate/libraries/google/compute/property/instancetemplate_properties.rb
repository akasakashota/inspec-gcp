# frozen_string_literal: false

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
require "google/compute/property/instancetemplate_properties_disks"
require "google/compute/property/instancetemplate_properties_guest_accelerators"
require "google/compute/property/instancetemplate_properties_network_interfaces"
require "google/compute/property/instancetemplate_properties_scheduling"
require "google/compute/property/instancetemplate_properties_service_accounts"
require "google/compute/property/instancetemplate_properties_tags"
module GoogleInSpec
  module Compute
    module Property
      class InstanceTemplateProperties
        attr_reader :arguments

        attr_reader :can_ip_forward

        attr_reader :description

        attr_reader :disks

        attr_reader :labels

        attr_reader :machine_type

        attr_reader :min_cpu_platform

        attr_reader :metadata

        attr_reader :guest_accelerators

        attr_reader :network_interfaces

        attr_reader :scheduling

        attr_reader :service_accounts

        attr_reader :tags

        def initialize(arguments = nil, parent_identifier = nil)
          @arguments = arguments
          return if arguments.nil?

          @parent_identifier = parent_identifier
          @can_ip_forward = arguments["canIpForward"]
          @description = arguments["description"]
          @disks = GoogleInSpec::Compute::Property::InstanceTemplatePropertiesDisksArray.parse(arguments["disks"], to_s)
          @labels = arguments["labels"]
          @machine_type = arguments["machineType"]
          @min_cpu_platform = arguments["minCpuPlatform"]
          @metadata = arguments["metadata"]
          @guest_accelerators = GoogleInSpec::Compute::Property::InstanceTemplatePropertiesGuestAcceleratorsArray.parse(arguments["guestAccelerators"], to_s)
          @network_interfaces = GoogleInSpec::Compute::Property::InstanceTemplatePropertiesNetworkInterfacesArray.parse(arguments["networkInterfaces"], to_s)
          @scheduling = GoogleInSpec::Compute::Property::InstanceTemplatePropertiesScheduling.new(arguments["scheduling"], to_s)
          @service_accounts = GoogleInSpec::Compute::Property::InstanceTemplatePropertiesServiceAccountsArray.parse(arguments["serviceAccounts"], to_s)
          @tags = GoogleInSpec::Compute::Property::InstanceTemplatePropertiesTags.new(arguments["tags"], to_s)
        end

        def to_s
          "#{@parent_identifier} InstanceTemplateProperties"
        end

        def self.un_parse(item, current_path)
          return if item.nil?

          way_to_parse = {
            "can_ip_forward" => ->(x, path) { x.nil? ? [] : ["its('#{path}.can_ip_forward') { should cmp #{x.inspect} }"] },
            "description" => ->(x, path) { x.nil? ? [] : ["its('#{path}.description') { should cmp #{x.inspect} }"] },
            "disks" => ->(x, path) { x.nil? ? [] : x.map { |single| "its('#{path}.disks') { should include '#{single.to_json}' }" } },
            "labels" => ->(x, path) { x.nil? ? [] : x.map { |k, v| "its('#{path}.labels') { should include(#{k.inspect} => #{v.inspect}) }" } },
            "machine_type" => ->(x, path) { x.nil? ? [] : ["its('#{path}.machine_type') { should cmp #{x.inspect} }"] },
            "min_cpu_platform" => ->(x, path) { x.nil? ? [] : ["its('#{path}.min_cpu_platform') { should cmp #{x.inspect} }"] },
            "metadata" => ->(x, path) { x.nil? ? [] : x.map { |k, v| "its('#{path}.metadata') { should include(#{k.inspect} => #{v.inspect}) }" } },
            "guest_accelerators" => ->(x, path) { x.nil? ? [] : x.map { |single| "its('#{path}.guest_accelerators') { should include '#{single.to_json}' }" } },
            "network_interfaces" => ->(x, path) { x.nil? ? [] : x.map { |single| "its('#{path}.network_interfaces') { should include '#{single.to_json}' }" } },
            "scheduling" => ->(x, path) { x.nil? ? [] : GoogleInSpec::Compute::Property::InstanceTemplatePropertiesScheduling.un_parse(x, "#{path}.scheduling") },
            "service_accounts" => ->(x, path) { x.nil? ? [] : x.map { |single| "its('#{path}.service_accounts') { should include '#{single.to_json}' }" } },
            "tags" => ->(x, path) { x.nil? ? [] : GoogleInSpec::Compute::Property::InstanceTemplatePropertiesTags.un_parse(x, "#{path}.tags") },
          }
          way_to_parse.map do |k, v|
            v.call(item.method(k).call, current_path)
          end
        end

        def to_json(*_args)
          @arguments.to_json
        end

        # other is a string representation of this object
        def ==(other)
          @arguments == JSON.parse(other)
        end
      end
    end
  end
end
