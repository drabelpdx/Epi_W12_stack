class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :title, :string
      t.column :body, :text

      t.timestamps
    end
  end
end
