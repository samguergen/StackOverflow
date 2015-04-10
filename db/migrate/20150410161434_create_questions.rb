class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :creator, class_name: 'User'
      t.string :title
      t.string :content
      t.references :best_answer, class_name: 'Answer'

      t.timestamps null: false
    end
  end
end
