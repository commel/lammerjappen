class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.boolean :available

      t.timestamps
    end
  end
end
