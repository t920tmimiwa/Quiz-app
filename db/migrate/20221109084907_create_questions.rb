class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :que
      t.text :answer1
      t.text :answer2
      t.text :answer3
      t.text :answer4
      t.integer :user_id
      
      t.timestamps
    end
  end
end
