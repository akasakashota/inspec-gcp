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
  module Container
    module Property
      class RegionalClusterNodeConfigTaints
        attr_reader :arguments

        attr_reader :key

        attr_reader :value

        attr_reader :effect

        def initialize(arguments = nil, parent_identifier = nil)
          @arguments = arguments
          return if arguments.nil?

          @parent_identifier = parent_identifier
          @key = arguments["key"]
          @value = arguments["value"]
          @effect = arguments["effect"]
        end

        def to_s
          "#{@parent_identifier} RegionalClusterNodeConfigTaints"
        end

        def self.un_parse(item, current_path)
          return if item.nil?

          way_to_parse = {
            "key" => ->(x, path) { x.nil? ? [] : ["its('#{path}.key') { should cmp #{x.inspect} }"] },
            "value" => ->(x, path) { x.nil? ? [] : ["its('#{path}.value') { should cmp #{x.inspect} }"] },
            "effect" => ->(x, path) { x.nil? ? [] : ["its('#{path}.effect') { should cmp #{x.inspect} }"] },
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

      class RegionalClusterNodeConfigTaintsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return RegionalClusterNodeConfigTaints.new(value, parent_identifier) unless value.is_a?(::Array)

          value.map { |v| RegionalClusterNodeConfigTaints.new(v, parent_identifier) }
        end

        def self.un_parse(arr, path)
          return if arr.nil?

          value.map { |v| RegionalClusterNodeConfigTaints.un_parse(v, path) }
        end
      end
    end
  end
end
