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
module GoogleInSpec
  module Dataproc
    module Property
      class ClusterConfigMasterConfigManagedGroupConfig
        attr_reader :arguments

        attr_reader :instance_template_name

        attr_reader :instance_group_manager_name

        def initialize(arguments = nil, parent_identifier = nil)
          @arguments = arguments
          return if arguments.nil?

          @parent_identifier = parent_identifier
          @instance_template_name = arguments["instanceTemplateName"]
          @instance_group_manager_name = arguments["instanceGroupManagerName"]
        end

        def to_s
          "#{@parent_identifier} ClusterConfigMasterConfigManagedGroupConfig"
        end

        def self.un_parse(item, current_path)
          return if item.nil?

          way_to_parse = {
            "instance_template_name" => ->(x, path) { x.nil? ? [] : ["its('#{path}.instance_template_name') { should cmp #{x.inspect} }"] },
            "instance_group_manager_name" => ->(x, path) { x.nil? ? [] : ["its('#{path}.instance_group_manager_name') { should cmp #{x.inspect} }"] },
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
