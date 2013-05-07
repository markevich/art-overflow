require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminApproveInvite

end

module RailsAdmin
  module Config
    module Actions
      class ApproveInvite < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :collection do 
          true
        end


        register_instance_option :controller do
          Proc.new do
           objects = list_entries(@model_config, :destroy)
           objects.delete_if {|o| !o.accepted_at.nil? }
           objects.each do |object|
             object.update_attribute(:accepted_at, DateTime.now)
           end

           flash[:notice] = "Вы успешно запланировали приглашение #{objects.to_a.count} новых пользователей!"
           redirect_to back_or_index
          end

        end
        register_instance_option :bulkable? do
          true
        end

        register_instance_option :link_icon do
          'icon-check'
        end

      end
    end
  end
end
