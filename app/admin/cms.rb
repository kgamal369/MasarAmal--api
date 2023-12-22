ActiveAdmin.register Cms do
  permit_params :page_name, :language, :location, :type, :value, :last_modified_date

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params 
  #
  # or
  #
  # permit_params do
  #   permitted = []
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
