class AddSurveyTypeToSurveys < ActiveRecord::Migration
  def change
    add_column(:surveys, :survey_type, :int)
  end
end
