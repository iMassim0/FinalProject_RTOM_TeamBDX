class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  NAME_REGEX = /\A[[:alpha:]\s'"\-_&@!?()\[\]-]*\z/u
  ZIPCODE_REGEX = /\A[0-9]{2,}\z/
  PHONE_REGEX = /\A\d{10}\z/

  validates :username, presence: true, uniqueness: { case_sensitive: :false }, format: { with: NAME_REGEX }
  validates :del_zipcode, :fac_zipcode, format: { with: ZIPCODE_REGEX }
  validates :phonenumber, format: { with: PHONE_REGEX }

end
