class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  
  def avatar_thumbnail 
  	if avatar.attached?
  		avatar.variant(resize: '40x40!').processed 	
  	else
  		'/default_avatar.jpg'
  	end	
  end

  def thumbnail input
    if avatar.attached?
      return self.avatar[input].variant(resize: '300x300!').processed
    end  
  end


end
