require "rails_helper"
require "cancan/matchers"

RSpec.describe Wobauth::AdUsersHelper, :type => :helper, unless: ENV['NOLDAP'].present? do
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

  describe "#new_from_aduser_link" do
    let(:mail) { 'tester@example.org' }
    let(:model) { Wobauth::User }
    let(:aduser) { double(Wobauth::AdUser) }

    before(:each) do
      [:username, :sn, :givenname, :cn, :dn, :mail, :title, :telephonenumber,
       :facsimiletelephonenumber, :mobile, :description, :department, 
       :company, :postalcode, :l, :streetaddress, :displayname
      ].each do |attr|
        allow(aduser).to receive(attr).and_return("dummy")
      end
    end

    describe "with ability to create users" do
      subject { Capybara.string(helper.new_from_aduser_link(model, aduser)) }

      context "contact does not yet exist" do
	before(:each) do
	  expect(aduser).to receive(:mail).at_least(:once).and_return(mail)
          expect(controller).to receive(:can?).and_return(true)
	end
	it { expect(subject.find("a")['href']).to match wobauth.new_user_path }
	it { expect(subject.find("a")['class']).to eq "btn btn-primary" }
      end

      context "contact already exist" do
        let!(:user) { FactoryBot.create(:user, email: mail) }
	before(:each) do
	  expect(aduser).to receive(:mail).at_least(:once).and_return(mail)
	end
	it { expect(subject.find("a")['href']).to match wobauth.user_path(user) }
	it { expect(subject.find("a")['class']).to eq "btn btn-secondary" }
      end

      context "mail is empty" do
	before(:each) do
	  expect(aduser).to receive(:mail).at_least(:once).and_return("")
          expect(controller).to receive(:can?).and_return(true)
	end
	it { expect(subject.find("a")['href']).to match wobauth.new_user_path }
	it { expect(subject.find("a")['class']).to eq "btn btn-danger" }
      end
    end
  end

end
