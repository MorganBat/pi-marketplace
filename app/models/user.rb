class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Setting devise methods
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    # Associating user with listings, also set the dependent: :destroy
    # to prevent orphaned records if a user deletes their account
    has_many :listings, dependent: :destroy
end
