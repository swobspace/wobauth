require 'rails_helper'

module Wobauth
  RSpec.describe Authority, type: :model do
    it { is_expected.to belong_to(:authorizable) }
    it { is_expected.to belong_to(:role) }
    it { is_expected.to belong_to(:authorized_for) }

    it { is_expected.to validate_presence_of(:authorizable_id) }
    it { is_expected.to validate_presence_of(:authorizable_type) }
    it { is_expected.to validate_presence_of(:role_id) }

    it "simple factory working" do
      f = FactoryBot.create(:authority)
      g = FactoryBot.create(:authority)
      expect(f).to be_valid
      expect(g).to be_valid
    end

  end
end
