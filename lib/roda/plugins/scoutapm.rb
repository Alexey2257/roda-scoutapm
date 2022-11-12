# frozen_string_literal: true

require_relative "../../blank"

class Roda
  module RodaPlugins
    module Scoutapm
      # module ClassMethods
      #   def call(env)
      #     ScoutApm::Rack.transaction(env['REQUEST_PATH'], env) do
      #       app.call(env)
      #     end
      #   end
      # end
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
