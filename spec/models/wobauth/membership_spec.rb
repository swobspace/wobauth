require 'rails_helper'

module Wobauth

  RSpec.describe Membership, type: :model do
    it { is_expected.to belong_to(:group) }
    it { is_expected.to belong_to(:user).class_name('Wobauth::User') }

    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:group_id) }

    it "simple factory working" do
      f = FactoryBot.create(:membership)
      g = FactoryBot.create(:membership)
      expect(f).to be_valid
      expect(g).to be_valid
    end
  end
end
