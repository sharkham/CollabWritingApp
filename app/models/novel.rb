class Novel < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships

  has_many :snippets

  # accepts_nested_attributes_for :memberships

  def membership_attributes=(membership_attributes)
    membership_attributes.values.each do |mem_attr|
      # what Avi did here:
      # if membership_attributes[:name].present?
      unless mem_attr["role"] == ""
        membership = membership.create_by(mem_attr)
        # if !self.categories.include?(membership)
          self.memberships << membership
        #   # what Avi did for this instead: (building the association directly)
        #   # self.post_categories.build(:category => category)
        # end
      end
    end
  end
end
