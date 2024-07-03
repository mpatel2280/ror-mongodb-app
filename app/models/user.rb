# app/models/user.rb
class User
    include Mongoid::Document
    include Mongoid::Timestamps
  
    field :name, type: String
    field :email, type: String
    field :password_digest, type: String
  
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    # validates :password, presence: true, length: { minimum: 6 }
    validates :password, presence: true, length: { minimum: 6 }, on: :create

    before_save :downcase_email

    attr_reader :password
    attr_accessor :password_confirmation

  
    # has_secure_password

    def password=(new_password)
        @password = new_password
        self.password_digest = BCrypt::Password.create(new_password)
    end
    
    def authenticate(password)
        BCrypt::Password.new(password_digest).is_password?(password)
    end

    private

    def downcase_email
        self.email = email.downcase
    end
    
  
    index({ email: 1 }, { unique: true, name: "email_index" })
  end
  