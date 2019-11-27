class CreateQuestionOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :question_options do |t|
      t.string :prompt
      t.integer :score
      t.belongs_to :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
