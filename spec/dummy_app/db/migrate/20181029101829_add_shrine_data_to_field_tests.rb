class AddShrineDataToFieldTests < MigrationBase
  def change
    add_column :field_tests, :shrine_asset_data, :text
    add_column :field_tests, :shrine_versioning_asset_data, :text
  end
end
