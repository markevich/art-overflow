class PermittedParams < Struct.new(:params, :user)
  def invite
    params.require(:invite).permit(:email)
  end

  def picture
    params.require(:picture).permit(:name, :path)
  end
end