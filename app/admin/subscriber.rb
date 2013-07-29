ActiveAdmin.register Subscriber do
  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    column :id
    column :email
    column :token
    column :created_at
    column :updated_at
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "Subscriber details" do
      f.input :email
      f.input :token
    end
    f.actions
  end
end
