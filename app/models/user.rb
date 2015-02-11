class User < ActiveRecord::Base
	has_many :group_users
	has_many :groups, :through => :group_users
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
