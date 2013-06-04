require 'bundler/setup'
require 'rspec'
require 'spec_helper'
require 'rack/test'

describe 'Index' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

   context "Index" do
     before { get '/' }
     subject { last_response}
     it { should be_ok }
     its(:body) { should include "<a href='/treinar'>Treinar</a>" }
     its(:body) { should include "<a href='/classificar'>Classificar</a>" }
   end

   context "Classifier View" do
     before { get '/classificar' }
     subject { last_response}
     it { should be_ok }
     its(:body) { should include "<form method='POST' action=''>" }
     its(:body) { should include "<textarea name='texto'></textarea>" }
     its(:body) { should include "<input type='submit' value='classificar'>" }
   end
end
