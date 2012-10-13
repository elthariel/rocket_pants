# Provides a bunch of default mongoid integration entry points.

module RocketPants
  module MongoidIntegration
    extend ActiveSupport::Concern

    included do
      map_error! Mongoid::Errors::DocumentNotFound, RocketPants::NotFound
      # map_error! ActiveRecord::RecordNotFound, RocketPants::NotFound
      # map_error! ActiveRecord::RecordNotUnique, RocketPants::Conflict
      # map_error!(ActiveRecord::RecordNotSaved) { RocketPants::InvalidResource.new nil }
      # map_error! ActiveRecord::RecordInvalid do |exception|
      #   RocketPants::InvalidResource.new exception.record.errors
      # end
    end

    ActiveSupport.on_load :mongoid do
      RocketPants::Base.send :include, RocketPants::MongoidIntegration
    end

  end
end



