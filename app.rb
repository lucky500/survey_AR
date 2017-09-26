require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/survey")
require("./lib/question")
require("pg")

get('/') do
  @surveys = Survey.all()
  @questions = Question.all()
  erb(:index)
end

post('/') do
  title = params.fetch("title")
  survey = Survey.new(:title => title)
  survey.save
  erb :success
end

get('/:id') do
  @survey = Survey.find(params.fetch("id").to_i())
  erb(:survey)
end

post("/:id") do
  query = params.fetch("query")
  survey_id = params.fetch("survey_id").to_i()
  @survey = Survey.find(survey_id)
  @question = Question.new({:query => query, :survey_id => survey_id,})
  @question.save
  redirect back
end

get("/:id/edit") do
  @survey = Survey.find(params.fetch("id").to_i())
  erb(:survey_edit)
end

patch("/:id") do
  title = params.fetch("title")
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.update({:title => title})
  erb(:survey)
end

get("/:id/:id1") do
  @survey = Survey.find(params.fetch("id").to_i())
  @question = Question.find(params.fetch("id1").to_i())
  erb :question
end

patch("/:id") do
  question = params.fetch("query")
  @question = Question.find(params.fetch("id").to_i())
  @question.update({:query => query})
  erb(:question)
end
