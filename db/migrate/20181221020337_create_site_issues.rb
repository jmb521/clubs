class CreateSiteIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :site_issues do |t|
      t.string :name
      t.string :email
      t.string :concern
      t.timestamps
    end
  end
end
