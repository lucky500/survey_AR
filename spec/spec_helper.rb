ENV['RACK_ENV'] = 'test'
require('rspec')
require('sinatra/activerecord')
require('survey')
require('question')

RSpec.configure do |config|
  config.after(:each) do
    Question.all().each() do |question|
      question.destroy()
    end
  end
end
