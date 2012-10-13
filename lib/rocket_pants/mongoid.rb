# Provides a bunch of default mongoid integration entry points.

module RocketPants
  module MongoidIntegration
    extend ActiveSupport::Concern

    included do
      map_error! Mongoid::Errors::DocumentNotFound, RocketPants::NotFound
      map_error! Mongoid::Errors::Validations do |exception|
        RocketPants::InvalidResource.new exception.summary
      end
      # Extend me if you can :)
    end

    ActiveSupport.on_load :mongoid do
      RocketPants::Base.send :include, RocketPants::MongoidIntegration
    end

  end
end



