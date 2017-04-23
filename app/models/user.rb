class User < ActiveRecord::Base
  before_save { self.email = email.downcase if email.present? }
  #before_save { self.name = name.downcase.split(" ").capitalize.join(" ") if name.present? }

  before_save :captialized_name

  validates :name, length: { minimum:1 , maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
              presence: true,
              uniqueness: { case_sensitive: false },
              length: { minimum: 3, maximum: 254 }

  has_secure_password

  def captialized_name
    if name
      nameArray = []
      arrayOfName = name.downcase.split(" ")
      arrayOfName.each do |f|
        nameArray << f.capitalize
      end
      self.name = nameArray.join(" ")
    end

  end
end
