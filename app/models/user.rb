class User < ApplicationRecord
  validates_presence_of :email, :password, :password_confirmation
  validate :match_passwords
  validates_length_of :password, minimum: 6, maximum: 10

  def role
    "client"
  end

  private
  def match_passwords
    if !password.eql?(password_confirmation)
     errors.add(:password, 'error validate password')
    end
  end

end
