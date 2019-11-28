class CreateQuizQuestion < ActiveRecord::Migration[6.0]
  def change
    create_table :quiz_questions do |t|
      t.integer :order
      t.string :answer
      t.integer :score
      t.references :quiz, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
