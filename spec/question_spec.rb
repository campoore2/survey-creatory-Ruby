require('spec_helper')

describe(Question) do
  describe('#survey') do
    it "tells you what questions are in the survey" do
      test_survey = Survey.create({:name => "Favourite Colour"})
      test_question = Question.create({:question => "Blue", :survey_id => test_survey.id})
      expect(test_question.survey()).to(eq(test_survey))
    end
  end
end
