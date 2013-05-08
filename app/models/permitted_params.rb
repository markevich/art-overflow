class PermittedParams < Struct.new(:params, :user)
  def invite
    params.require(:invite).permit(:email)
  end

  def drawing
    params.require(:drawing).permit(:name, :path)
  end
end