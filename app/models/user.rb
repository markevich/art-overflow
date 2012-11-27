class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :rememberable
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :trackable, :validatable, :confirmable, :omniauthable

  attr_accessible :email, :name, :password,
   :password_confirmation, :remember_me, :provider, :uid, :avatar

  mount_uploader :avatar, AvatarUploader

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = find_by_provider_and_uid auth.provider, auth.uid
    unless user
      user = new(name: auth.extra.raw_info.name,
                 provider: auth.provider,
                 uid: auth.uid,
                 email: auth.info.email,
                 password: Devise.friendly_token[0,20])
      user.skip_confirmation!
      user.save!
    end
    user
  end




#какой-то фарш с форума, надо потом глянуть и сделать авторизацию на основе метод миссинга

  # def method_missing(provider)
  #   if !User.omniauth_providers.index(provider).nil?
  #     #omniauth = request.env["omniauth.auth"]
  #     omniauth = env["omniauth.auth"]
    
  #     if current_user #or User.find_by_email(auth.recursive_find_by_key("email"))
  #       current_user.user_tokens.find_or_create_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
  #        flash[:notice] = "Authentication successful"
  #        redirect_to edit_user_registration_path
  #     else
    
  #     authentication = UserToken.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
   
  #       if authentication
  #         flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => omniauth['provider']
  #         sign_in_and_redirect(:user, authentication.user)
  #         #sign_in_and_redirect(authentication.user, :event => :authentication)
  #       else
          
  #         #create a new user
  #         unless omniauth.recursive_find_by_key("email").blank?
  #           user = User.find_or_initialize_by_email(:email => omniauth.recursive_find_by_key("email"))
  #         else
  #           user = User.new
  #         end
          
  #         user.apply_omniauth(omniauth)
  #         #user.confirm! #unless user.email.blank?

  #         if user.save
  #           flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => omniauth['provider'] 
  #           sign_in_and_redirect(:user, user)
  #         else
  #           session[:omniauth] = omniauth.except('extra')
  #           redirect_to new_user_registration_url
  #         end
  #       end
  #     end
  #   end
  # end


end
