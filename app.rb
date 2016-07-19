require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require('./lib/survey')
require('./lib/question')
also_reload('lib/**/*.rb')
require('pg')


get('/') do
  @survey = Survey.all()
  erb(:index)
end

get('/create') do
  erb(:create)
end

post('/create') do
  name = params.fetch("name")
  @survey = Survey.create({:name => name})
  @survey = Survey.all()
  erb(:index)
end

get('/survey/:id/delete') do
  id = params.fetch('id').to_i()
  survey_to_delete = Survey.find(id)
  Survey.delete(survey_to_delete)
  @survey = Survey.all()
  erb(:index)
end

get('/survey/:id/edit') do
  survery_id = params.fetch('id').to_i()
  @survey = Survey.find(survery_id)
  @question = @survey.question
  erb(:edit)
end

post('/survey/:id/edit') do
  question = params.fetch("add_question")
  survey_id = params.fetch("id").to_i()
  question_type = params.fetch('question_type').to_i()
  @question = Question.create({:question => question, :survey_id => survey_id, :question_type => question_type})
  @survey = Survey.find(survey_id)
  erb(:question_form)
end

get('/question/:id/:question_id/delete') do
  id = params.fetch('id').to_i
  question_id = params.fetch('question_id').to_i()
  question_to_delete = Question.find(question_id)
  Question.delete(question_to_delete)
  @survey = Survey.find(id)
  @question = @survey.question()
  erb(:edit)
end

get('/question/:id/:question_id/edit_question') do
  id = params.fetch('id').to_i
  question_id = params.fetch('question_id').to_i()
  @question = Question.find(question_id)
  erb(:edit_question)
end

get('/question/:question_id/edit_question') do
  question_id = params.fetch('question_id').to_i()
  new_question = params.fetch('edit_question')
  question = Question.find(question_id)
  @survey = Survey.find(question.survey_id())
  question.update({:question => new_question})
  @question = @survey.question()
  erb(:edit)
end
