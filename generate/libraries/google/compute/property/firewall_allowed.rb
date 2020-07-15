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
      class FirewallAllowed
        attr_reader :arguments

        attr_reader :ip_protocol

        attr_reader :ports

        def initialize(arguments = nil, parent_identifier = nil)
          @arguments = arguments
          return if arguments.nil?

          @parent_identifier = parent_identifier
          @ip_protocol = arguments["IPProtocol"]
          @ports = arguments["ports"]
        end

        def to_s
          "#{@parent_identifier} FirewallAllowed"
        end

        def self.un_parse(item, current_path)
          return if item.nil?

          way_to_parse = {
            "ip_protocol" => ->(x, path) { x.nil? ? [] : ["its('#{path}.ip_protocol') { should cmp #{x.inspect} }"] },
            "ports" => ->(x, path) { x.nil? ? [] : x.map { |single| "its('#{path}.ports') { should include #{single.inspect} }" } },
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

      class FirewallAllowedArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return FirewallAllowed.new(value, parent_identifier) unless value.is_a?(::Array)

          value.map { |v| FirewallAllowed.new(v, parent_identifier) }
        end

        def self.un_parse(arr, path)
          return if arr.nil?

          value.map { |v| FirewallAllowed.un_parse(v, path) }
        end
      end
    end
  end
end
