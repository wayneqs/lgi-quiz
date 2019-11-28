class CreateJoinTableQuizQuestion < ActiveRecord::Migration[6.0]
  def change
    create_join_table :quizzes, :questions, table_name: "quiz_questions" do |t|
      t.integer :order
      t.string :answer
      t.integer :score
      t.index [:quiz_id, :question_id]
      t.index [:question_id, :quiz_id]
    end
  end
end
