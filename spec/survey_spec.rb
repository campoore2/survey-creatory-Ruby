require('spec_helper')

describe(Survey) do
  describe('#question') do
    it "tells you what questions are in the survey" do
      test_survey = Survey.create({:name => "Favourite Colour"})
      test_question = Question.create({:question => "Blue", :survey_id => test_survey.id})
      expect(test_survey.question()).to(eq([test_question]))
    end
  end

  describe('#cap_letter') do
    it "capitalize's the first letter of a word." do
      test_survey = Survey.create({:name => "favourite colour"})
      expect(test_survey.name()).to(eq("Favourite colour"))
    end
  end
end
