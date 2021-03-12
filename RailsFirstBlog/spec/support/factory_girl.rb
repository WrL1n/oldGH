RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

 	# ---------  FactoryGirl.find_definitions Вызывает все фабрики  --------
  # config.before(:suite) do
  #   FactoryGirl.find_definitions
  # end
end