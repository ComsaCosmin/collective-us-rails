class GroupUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :group


	def group_user
		Group.where(:group_id => group.id)
	end
end
