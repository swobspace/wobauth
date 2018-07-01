require "rails_helper"
require "cancan/matchers"

RSpec.describe Wobauth::ApplicationHelper, :type => :helper do
  include Devise::Test::ControllerHelpers

  describe "#data_url" do
    context "with nonexisting class method data_url" do
      before(:each) do
        expect(Wobauth::User).to receive(:respond_to?).with(:data_url).and_return(false)
      end
      it "raise a RuntimeError" do
        expect { 
          helper.data_url("Wobauth::User") 
        }.to raise_error(RuntimeError)
      end

    end
    context "with existing class method data_url" do
      let(:url) { "/wobauth/anywhere/anypath" }
      before(:each) do
        expect(Wobauth::User).to receive(:data_url).and_return(url)
      end

      it { expect(helper.data_url("Wobauth::User")).to eq(url) }
    end
  end

end
