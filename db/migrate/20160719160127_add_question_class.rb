class AddQuestionClass < ActiveRecord::Migration
  def change
    create_table(:questions) do |t|
      t.column(:question, :string)
      t.column(:survey_id, :int)
    end
  end
end
