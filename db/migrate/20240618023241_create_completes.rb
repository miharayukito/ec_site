class CreateCompletes < ActiveRecord::Migration[7.1]
  def change
    create_table :completes do |t|
      t.string :title
      t.text :description
      t.string :email

      t.timestamps
    end
  end
end
