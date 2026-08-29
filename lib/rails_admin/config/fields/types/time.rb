# frozen_string_literal: true

require 'rails_admin/config/fields/types/datetime'

module RailsAdmin
  module Config
    module Fields
      module Types
        class Time < RailsAdmin::Config::Fields::Types::Datetime
          RailsAdmin::Config::Fields::Types.register(self)

          def parse_value(value)
            value = "2000-01-01T#{value}" if value.match?(/\A\d{2}:\d{2}(?::\d{2}(?:\.\d+)?)?\z/)
            abstract_model.model.type_for_attribute(name.to_s).serialize(super(value))&.change(year: 2000, month: 1, day: 1)
          end

          register_instance_option :filter_operators do
            %w[default between] + (required? ? [] : %w[_separator _not_null _null])
          end

          register_instance_option :strftime_format do
            '%H:%M'
          end

          def form_value
            (value || form_default_value)&.in_time_zone&.strftime('%H:%M')
          end
        end
      end
    end
  end
end
