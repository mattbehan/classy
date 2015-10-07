RSpec.configure do |config|

  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DataBaseCleaner.clean
    end
  end
end
