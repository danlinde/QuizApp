class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :response
      t.boolean :correctness, :default => false
      t.timestamps
    end
  end
end
