class PermittedParams < Struct.new(:params, :user)
  def subscriber
    params.require(:subscriber).permit(:email)
  end

  def picture
    params.require(:picture).permit(:name, :path)
  end
end