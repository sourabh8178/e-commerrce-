ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :subcategory_id, :discription, :price, :image, :discount
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :subcategory_id, :discription, :price, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :name
      f.input :discription
      f.input :price
      f.input :discount
      f.input "image" do |pro|
      image_tag(pro.image_url, height:"50", width: "50") rescue nil
    end
      f.input :subcategory_id, as: :select, collection: option_groups_from_collection_for_select(Category.all, :subcategory, :name, :id, :name, resource.subcategory_id)

    f.actions 
    end
   end 
end
  


# index do
#     id_column
#     column :name
#     column :image 
#     column :sub_category
#     actions
#   end





