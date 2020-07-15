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
  module Compute
    module Property
      class InstanceNetworkInterfacesAccessConfigs
        attr_reader :arguments

        attr_reader :name

        attr_reader :nat_ip

        attr_reader :type

        def initialize(arguments = nil, parent_identifier = nil)
          @arguments = arguments
          return if arguments.nil?

          @parent_identifier = parent_identifier
          @name = arguments["name"]
          @nat_ip = arguments["natIP"]
          @type = arguments["type"]
        end

        def to_s
          "#{@parent_identifier} InstanceNetworkInterfacesAccessConfigs"
        end

        def self.un_parse(item, current_path)
          return if item.nil?

          way_to_parse = {
            "name" => ->(x, path) { x.nil? ? [] : ["its('#{path}.name') { should cmp #{x.inspect} }"] },
            "nat_ip" => ->(x, path) { x.nil? ? [] : ["its('#{path}.nat_ip') { should cmp #{x.inspect} }"] },
            "type" => ->(x, path) { x.nil? ? [] : ["its('#{path}.type') { should cmp #{x.inspect} }"] },
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

      class InstanceNetworkInterfacesAccessConfigsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return InstanceNetworkInterfacesAccessConfigs.new(value, parent_identifier) unless value.is_a?(::Array)

          value.map { |v| InstanceNetworkInterfacesAccessConfigs.new(v, parent_identifier) }
        end

        def self.un_parse(arr, path)
          return if arr.nil?

          value.map { |v| InstanceNetworkInterfacesAccessConfigs.un_parse(v, path) }
        end
      end
    end
  end
end
