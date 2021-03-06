class AddAttachmentAssetToDocument < ActiveRecord::Migration
  def self.up
    add_column :documents, :asset_file_name, :string
    add_column :documents, :asset_content_type, :string
    add_column :documents, :asset_file_size, :integer
    add_column :documents, :asset_updated_at, :datetime
  end

  def self.down
    remove_column :documents, :asset_file_name
    remove_column :documents, :asset_content_type
    remove_column :documents, :asset_file_size
    remove_column :documents, :asset_updated_at
  end
end
