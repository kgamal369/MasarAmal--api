ActiveAdmin.register Cms do
  permit_params :pagename, :language, :location, :type, :value, :last_modified_date

  index do
    selectable_column
    id_column
    column :pagename
    column :language
    column :location
    column :type
    column :value
    column :last_modified_date
    actions
  end

  filter :pagename
  filter :language
  filter :location
  filter :type
  filter :value
  filter :last_modified_date

  form do |f|
    f.inputs 'Cms Details' do
      f.input :pagename
      f.input :language
      f.input :location
      f.input :type
      f.input :value
      f.input :last_modified_date
    end
    f.actions
  end
end
