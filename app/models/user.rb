class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  attr_accessor :password, :password_confirmation
  validates :email, presence: true,
                    uniqueness: true,
                    format: {
                      with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
                    }

  validates_confirmation_of :password
  before_save :downcase_email
  before_save :encrypt_password

  def downcase_email
    self.email = email.downcase
  end

  def encrypt_password
  self.password_salt = BCrypt::Engine.generate_salt
  self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
    user
    else
      nil
    end
  end
end
