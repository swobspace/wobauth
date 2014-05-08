require 'test_helper'

module Wobauth
  class TranslationTest < ActionController::TestCase

    should "translate Role for model and controller actions" do
      assert_match "Rolle", I18n.t('activerecord.models.' + 
                              Wobauth::Role.model_name.i18n_key.to_s) 
      assert_match "Rollen", I18n.t('controller.wobauth/roles')
      assert_match "Name", I18n.t('attributes.name')
      # assert_match "Rolle erstellen", t('w^.attributes.name')
    end

  end
end
