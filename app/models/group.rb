class Group < ActiveRecord::Base
	has_many :group_users
	has_many :users, :through => :group_users




	def group_user
		Group.joins(group_users).merge(GroupUser.where(:group_id => self.id))
	end
end
