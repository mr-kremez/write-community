class User < ActiveRecord::Base
  rolify
  has_many :books
  has_many :anotations, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ratyrate_rater

  LAYOUTS = [['White', 1], ['Black', 2]]

  def active_for_authentication? 
    super && !blocked?
  end 

  def inactive_message 
    if blocked? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
end
