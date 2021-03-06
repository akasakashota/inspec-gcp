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
require 'google/accesscontextmanager/property/serviceperimeter_spec_vpc_accessible_services'
module GoogleInSpec
  module AccessContextManager
    module Property
      class ServicePerimeterSpec
        attr_reader :resources

        attr_reader :access_levels

        attr_reader :restricted_services

        attr_reader :vpc_accessible_services

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @resources = args['resources']
          @access_levels = args['accessLevels']
          @restricted_services = args['restrictedServices']
          @vpc_accessible_services = GoogleInSpec::AccessContextManager::Property::ServicePerimeterSpecVPCAccessibleServices.new(args['vpcAccessibleServices'], to_s)
        end

        def to_s
          "#{@parent_identifier} ServicePerimeterSpec"
        end
      end
    end
  end
end
