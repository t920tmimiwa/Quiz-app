class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.text :body
      t.boolean :correct_answer, null: false, default: false
      t.integer :question_id

      t.timestamps
    end
  end
end
