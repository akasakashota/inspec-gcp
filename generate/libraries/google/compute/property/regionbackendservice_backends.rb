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
      class RegionBackendServiceBackends
        attr_reader :arguments

        attr_reader :description

        attr_reader :group

        def initialize(arguments = nil, parent_identifier = nil)
          @arguments = arguments
          return if arguments.nil?
          @parent_identifier = parent_identifier
          @description = arguments['description']
          @group = arguments['group']
        end

        def to_s
          "#{@parent_identifier} RegionBackendServiceBackends"
        end

        def self.un_parse(item, current_path)
          return if item.nil?
          way_to_parse = {
            'description' => ->(x, path) { x.nil? ? [] : ["its('#{path}.description') { should cmp #{x.inspect} }"] },
            'group' => ->(x, path) { x.nil? ? [] : ["its('#{path}.group') { should cmp #{x.inspect} }"] },
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

      class RegionBackendServiceBackendsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return RegionBackendServiceBackends.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| RegionBackendServiceBackends.new(v, parent_identifier) }
        end

        def self.un_parse(arr, path)
          return if arr.nil?
          value.map { |v| RegionBackendServiceBackends.un_parse(v, path) }
        end
      end
    end
  end
end
