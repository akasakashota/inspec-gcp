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
require "google/dataproc/property/cluster_config_security_config_kerberos_config"
module GoogleInSpec
  module Dataproc
    module Property
      class ClusterConfigSecurityConfig
        attr_reader :arguments

        attr_reader :kerberos_config

        def initialize(arguments = nil, parent_identifier = nil)
          @arguments = arguments
          return if arguments.nil?

          @parent_identifier = parent_identifier
          @kerberos_config = GoogleInSpec::Dataproc::Property::ClusterConfigSecurityConfigKerberosConfig.new(arguments["kerberosConfig"], to_s)
        end

        def to_s
          "#{@parent_identifier} ClusterConfigSecurityConfig"
        end

        def self.un_parse(item, current_path)
          return if item.nil?

          way_to_parse = {
            "kerberos_config" => ->(x, path) { x.nil? ? [] : GoogleInSpec::Dataproc::Property::ClusterConfigSecurityConfigKerberosConfig.un_parse(x, "#{path}.kerberos_config") },
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
