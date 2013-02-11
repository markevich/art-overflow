module  UserHelper
   def follow_user_button user
     if current_user.following?(user)
       button_to("Unfollow", unfollow_user_path(user))
     else
       button_to("Follow", follow_user_path(user))
     end
   end

end