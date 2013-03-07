module  UserHelper
   def follow_user_button user
     return unless current_user
     if current_user.following?(user)
       button_to("Unfollow", unfollow_user_path(user), remote: true, class: 'btn btn-primary', form: {id: 'unfollow_form'})
     else
       button_to("Follow", follow_user_path(user), remote: true, class: 'btn btn-warning', form: {id: 'follow_form'})
     end
   end

end
