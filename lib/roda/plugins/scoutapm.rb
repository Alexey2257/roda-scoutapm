# frozen_string_literal: true

require_relative "../../blank" unless String.new.respond_to?(:blank?)

class Roda
  # Integrate in Roda
  module RodaPlugins
    module Scoutapm
      # Inspect transaction on every request
      module RequestMethods
        private

        def always
          if defined? ::ScoutApm
            ::ScoutApm::Rack.transaction(inspect.gsub(/[#<>]/, ""), env) do
              super
            end
          else
            super
          end
        end
      end
    end

    register_plugin(:scoutapm, Scoutapm)
  end
end
