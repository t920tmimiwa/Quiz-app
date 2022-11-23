class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :que
      t.text :select
      t.integer :user_id
      
      t.timestamps
    end
  end
end
