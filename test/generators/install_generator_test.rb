require "test_helper"

class InstallGeneratorTest < Rails::Generators::TestCase
  tests Wobauth::Generators::InstallGenerator
  destination File.expand_path("../../tmp", __FILE__)
  setup :prepare_destination

  test "Assert all files are properly created" do
    run_generator
    assert_file "config/locales/wobauth.de.yml"
    assert_file "config/locales/wobauth.en.yml"
  end

  test "Initializer is copied" do
    run_generator
    assert_file "config/initializers/wobauth.rb" do |init|
      assert_match(/Wobauth.setup/, init)
    end
  end
end
