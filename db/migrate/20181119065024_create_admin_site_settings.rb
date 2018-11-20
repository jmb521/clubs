class CreateAdminSiteSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_site_settings do |t|
      t.string :page_name
      t.string :id_or_class_name
      t.string :value
      
      t.timestamps
    end
  end
end
