module ApplicationHelper

  def novel_membership(novel, user)
    membership = novel.users.find_by(id: user.id).memberships[0]
    membership.role
  end

end
