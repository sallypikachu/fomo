class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

   def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.update_attributes(
       email: auth.info.email,
       password: Devise.friendly_token[0,20],
       name: auth.info.name,   # assuming the user model has a name
       image: auth.info.image, # assuming the user model has an image
       access_token: auth.credentials.token
       )
       # If you are using confirmable and the provider(s) you use validate emails,
       # uncomment the line below to skip the confirmation emails.
       # user.skip_confirmation!
     end
    User.find_by(provider: auth.provider, uid: auth.uid).update_attributes(access_token: auth.credentials.token)
    User.find_by(provider: auth.provider, uid: auth.uid)
   end
end
