class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, ,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :is_admin
  # attr_accessible :title, :body
  #


  def admin?
    is_admin
  end

  def user!
    update_attribute("is_admin", false)
  end

  def admin!
    update_attribute("is_admin", true)
  end


end
