class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :orders
  has_many :products, through: :orders
  has_many :posts
  has_many :comments

  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_hash).where("lower(username) = :value OR lower(email) = :value", value: login.downcase).first
      else
        where(conditions.to_hash).first
      end
  end

  NAME_REGEX = /\A[[:alpha:]\s'"\-_&@!?()\[\]-]*\z/u
  ZIPCODE_REGEX = /\A[0-9]{2,}\z/
  PHONE_REGEX = /\A\d{10}\z/

  validates :username, presence: true, uniqueness: { case_sensitive: :false }, format: { with: NAME_REGEX }
  validates :del_zipcode, :fac_zipcode, format: { with: ZIPCODE_REGEX }, allow_nil: true, allow_blank: true
  validates :phonenumber, format: { with: PHONE_REGEX }, allow_nil: true, allow_blank: true

end
