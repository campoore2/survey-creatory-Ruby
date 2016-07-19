class DropColumn < ActiveRecord::Migration
  def change
    remove_column(:surveys, :survey_type, :int)

    add_column(:questions, :question_type, :int)
  end
end
