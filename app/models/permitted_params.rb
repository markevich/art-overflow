class PermittedParams < Struct.new(:params, :user)
  def invite
    params.require(:invite).permit(:email)
  end
end