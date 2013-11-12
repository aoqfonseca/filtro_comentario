require 'rubygems'
require 'bundler'

Bundler.setup(:default)
require 'activerecord'
Bundler.require

require File.join(File.dirname(__FILE__), 'models', 'comentarios')

dbconfig = YAML::load(File.open('local_database.yml'))
ActiveRecord::Base.establish_connection(dbconfig)

classifier = Classifier::Bayes.new('Spam', 'Not spam')


get '/' do
  haml :index
end

get '/classificar' do
  haml :classifier
end

post '/classificar' do
  text = params[:texto]
  @category = classifier.classify text
  @text = text
  haml :resultado
end

get "/treinar" do
  comentarios_spam = Textos.where(:status=>"3").limit(1000)
  comentarios_spam.each do |comentario|
    classifier.train_spam comentario.texto
  end

  comentarios_notspam = Textos.where(:status =>"1").limit(1000)
  comentarios_notspam.each do |comentario|
    classifier.train_not_spam comentario.texto
  end
  "Filtro treinado"
end
