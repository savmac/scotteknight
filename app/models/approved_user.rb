class ApprovedUser
  def initialize(user_params)
    @email = user_params[:email]
  end

  def approved?
    @email == 'scotteknight@gmail.com'
  end
end
