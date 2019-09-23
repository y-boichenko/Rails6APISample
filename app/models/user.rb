class User < ApplicationRecord
  has_secure_password
  acts_as_google_authenticated :method => :user_name_with_label

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }

  private

  def user_name_with_label
    "RailsApiSample | #{email}"
  end

end