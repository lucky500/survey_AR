require('spec_helper')

describe(Question) do

  describe("#survey") do
   it("tells which Survey it belongs to") do
     test_survey = Survey.create({:title => "survey"})
     test_question = Question.create({:query => "Question 1", :survey_id => test_survey.id})
     expect(test_question.survey()).to(eq(test_survey))
   end
 end

end
