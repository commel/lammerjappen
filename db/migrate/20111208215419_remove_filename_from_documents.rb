class RemoveFilenameFromDocuments < ActiveRecord::Migration
  def up
    remove_column :documents, :filename
  end

  def down
    add_column :documents, :filename, :string
  end
end
