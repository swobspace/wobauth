# frozen_string_literal: true

class Wobauth::PolymorphicSelectorComponent < ViewComponent::Base
  def initialize(form:, poly:, models:)
    @form = form
    @poly = poly
    @models = models
  end

  private
  attr_reader :form, :poly, :models

  def poly_type
    "#{poly}_type"
  end

  def poly_id
    "#{poly}_id"
  end

  def fobjtype
    form.object.send("#{poly}_type")
  end

  def collection
    models.map do |model|
      [].tap do |entry|
        entry << t('activerecord.models.' + model.underscore)
        entry << model
        entry << { 'data-url': myurl(model) }
      end
    end
  end

  def myurl(model)
    if model =~ /\AWobauth::/
      Wobauth::Engine.routes.url_helpers.polymorphic_path(model.constantize)
    else
      Rails.application.routes.url_helpers.polymorphic_path(model.constantize)
    end
  end

end
