class CreateCmsValues < ActiveRecord::Migration[7.1]
  def change
    unless table_exists?(:cms_values)
      create_table :cms_values do |t|
        t.integer :pagesectionid, null: false
        t.integer :sectioncomponentid, null: false
        t.integer :languageid, null: false
        t.string :value, null: false

        t.timestamps
      end

      add_index :cms_values, [:pagesectionid, :sectioncomponentid, :languageid], unique: true, name: 'index_cms_values_on_section_details'
      add_foreign_key :cms_values, :cms_languages, column: :languageid, primary_key: "languageid"
      add_foreign_key :cms_values, :cms_page_sections, column: :pagesectionid, primary_key: "pagesectionid"
      add_foreign_key :cms_values, :cms_section_components, column: :sectioncomponentid, primary_key: "sectioncomponentid"
    end  
  end
end
