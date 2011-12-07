class AddDefaultValueToAvailableInDocuments < ActiveRecord::Migration
  def change
    change_column_default :documents, :available, :true
  end
end
