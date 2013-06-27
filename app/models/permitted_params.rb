class PermittedParams < Struct.new(:params, :user)
  def subscriber
    params.require(:subscriber).permit(:email)
  end  
end
