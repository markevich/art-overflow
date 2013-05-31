class PermittedParams < Struct.new(:params, :user)
  def invite
    params.require(:promotion).permit(:email)
  end

  def picture
    params.require(:picture).permit(:name, :path)
  end
end