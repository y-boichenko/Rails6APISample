class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password, mfa_secret)
    @email = email
    @password = password
    @mfa_secret = mfa_secret || ''
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password, :mfa_secret

  def user
    user = User.find_by_email(email)
    return user if user && user.authenticate(password) && user.google_authentic?(mfa_secret)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end