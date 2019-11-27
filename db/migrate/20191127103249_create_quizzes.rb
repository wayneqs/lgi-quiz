class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.integer :score
      t.integer :max_score
      t.datetime :start_time
      t.datetime :end_time
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
