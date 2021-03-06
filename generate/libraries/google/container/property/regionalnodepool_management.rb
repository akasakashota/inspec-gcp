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
require 'google/container/property/regionalnodepool_management_upgrade_options'
module GoogleInSpec
  module Container
    module Property
      class RegionalNodePoolManagement
        attr_reader :arguments

        attr_reader :auto_upgrade

        attr_reader :auto_repair

        attr_reader :upgrade_options

        def initialize(arguments = nil, parent_identifier = nil)
          @arguments = arguments
          return if arguments.nil?
          @parent_identifier = parent_identifier
          @auto_upgrade = arguments['autoUpgrade']
          @auto_repair = arguments['autoRepair']
          @upgrade_options = GoogleInSpec::Container::Property::RegionalNodePoolManagementUpgradeOptions.new(arguments['upgradeOptions'], to_s)
        end

        def to_s
          "#{@parent_identifier} RegionalNodePoolManagement"
        end

        def self.un_parse(item, current_path)
          return if item.nil?
          way_to_parse = {
            'auto_upgrade' => ->(x, path) { x.nil? ? [] : ["its('#{path}.auto_upgrade') { should cmp #{x.inspect} }"] },
            'auto_repair' => ->(x, path) { x.nil? ? [] : ["its('#{path}.auto_repair') { should cmp #{x.inspect} }"] },
            'upgrade_options' => ->(x, path) { x.nil? ? [] : GoogleInSpec::Container::Property::RegionalNodePoolManagementUpgradeOptions.un_parse(x, "#{path}.upgrade_options") },
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
