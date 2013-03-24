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
  state_machine :state, :initial => :guest do
    event :admin do
      transition any => :admin
    end

    event :user do
      transition any => :user
    end

    event :admin do
      transition any => :admin
    end

    event :tutor do
      transition any => :tutor
    end
  end

end
