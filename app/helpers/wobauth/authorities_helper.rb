module Wobauth
  module AuthoritiesHelper
    def authorized_for_link(authorized_for)
      unless authorized_for.nil?
        link_to authorized_for, main_app.polymorphic_path(authorized_for)
      end
    end
  end
end
