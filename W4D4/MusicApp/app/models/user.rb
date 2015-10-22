class User < ActiveRecord::Base
  validates :email, :session_token, :password_digest, presence: true, uniqueness: true

  attr_reader :password
  after_initialize :ensure_session_token, :set_password_digest

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def set_password_digest
    self.password = password unless password.nil?
  end





  def password=(input_password)
    if input_password.nil? || input_password.length < 6
      raise "password must be atleast 6 characters"
    else
      self.password_digest = BCrypt::Password.create(password)
    end
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end




end
