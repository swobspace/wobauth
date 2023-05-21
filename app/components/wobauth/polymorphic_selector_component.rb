# frozen_string_literal: true

class Wobauth::PolymorphicSelectorComponent < ViewComponent::Base
  def initialize(form:, poly:, models:, disabled: false)
    @form = form
    @poly = poly
    @models = models
    @disabled = disabled
  end

  def render?
    models.count > 0
  end

private
  attr_reader :form, :poly, :models, :disabled

  def poly_type
    "#{poly}_type".to_sym
  end

  def poly_id
    "#{poly}_id".to_sym
  end

  def fobjpoly
    form.object.send(poly)
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
      Wobauth::Engine.routes.url_helpers.polymorphic_path(
        [:tokens, model.constantize], 
        script_name: scriptname
      )
    else
      Rails.application.routes.url_helpers.polymorphic_path([:tokens, model.constantize])
    end
  end

  def scriptname
    [ Rails.application.config.relative_url_root, 
      Wobauth::Engine.routes.find_script_name({})
    ].join("")
  end
end
