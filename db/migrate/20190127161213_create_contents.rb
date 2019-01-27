class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :title
      t.datetime :published_date
      t.string :author
      t.text :summary
      t.text :content
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
