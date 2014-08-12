module DjMon
  module ScopedPatch
    require 'active_record/version'

    def self.included base
      base.instance_eval do
        def scoped
          if ActiveRecord::VERSION::MAJOR >= 4
            all
          else
            super
          end
        end
      end
    end
  end
end

Delayed::Job.send :include, DjMon::ScopedPatch