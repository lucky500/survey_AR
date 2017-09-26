require('spec_helper')

describe(Survey) do
  describe("#questions") do
    it("tells which questions are in it") do
      test_survey = Survey.create({:title => "Survey1"})
      test_question1 = Question.create({:query => "question 1", :survey_id => test_survey.id})
      test_question2 = Question.create({:query => "Question 2", :survey_id => test_survey.id})
     expect(test_survey.questions()).to(eq([test_question1, test_question2]))
    end
  end
  it("converts the title to camel case") do
    survey = Survey.create({:title => "FINAGLE THE BUFFALO"})
    expect(survey.title()).to(eq("Finagle The Buffalo"))
  end

end
