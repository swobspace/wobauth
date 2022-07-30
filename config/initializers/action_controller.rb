require 'wobauth/application_helper'
ActiveSupport.on_load(:action_controller_base) do
  ::ActionController::Base.helper Wobauth::ApplicationHelper
end
