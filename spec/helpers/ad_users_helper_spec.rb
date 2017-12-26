require "rails_helper"
require "cancan/matchers"

RSpec.describe Wobauth::AdUsersHelper, :type => :helper do
  include Devise::Test::ControllerHelpers

  describe "#aduser_class" do
    let(:mail) { 'tester@example.org' }
    let(:model) { double(Wobauth::User) }
    let(:aduser) { double(Wobauth::AdUser) }

    context "contact does not yet exist" do
      before(:each) do
        expect(model).to receive(:exists?).with(any_args).and_return(false)
        expect(aduser).to receive(:mail).at_least(:once).and_return(mail)
      end
      it { expect(helper.aduser_class(model, aduser)).to eq("table-primary") }
    end

    context "contact already exist" do
      before(:each) do
        expect(model).to receive(:exists?).with(any_args).and_return(true)
        expect(aduser).to receive(:mail).at_least(:once).and_return(mail)
      end
      it { expect(helper.aduser_class(model, aduser)).to eq("table-success") }
    end

    context "mail is empty" do
      before(:each) do
        expect(aduser).to receive(:mail).at_least(:once).and_return("")
      end
      it { expect(helper.aduser_class(model, aduser)).to eq("table-danger") }
    end
  end

end
