class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table(:questions) do |t|
      t.column(:query, :string)
      t.column(:survey_id, :int)
      t.timestamps()
    end
  end
end
