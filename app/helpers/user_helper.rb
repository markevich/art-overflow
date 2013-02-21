module  UserHelper
   def follow_user_button user
     if current_user.following?(user)
       button_to("Unfollow", unfollow_user_path(user), :remote => true, :form => {:id => 'unfollow_form'})
     else
       button_to("Follow", follow_user_path(user), :remote => true, :form => {:id => 'follow_form'})
     end
   end

end