ActiveAdmin.register Event do
 index do
    column :name
    column :description
    column :event_type
    column :startdatetime
    column :duration
    column :responsible
    column :public
    column :confirm

    actions
  end

 permit_params :location, :organizer

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end


end
