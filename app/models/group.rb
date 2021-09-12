class Group < ApplicationRecord
  #アソシエーション########################################################################################################
  has_many :group_users
  has_many :users, through: :group_users
  accepts_nested_attributes_for :group_users
  has_many :group_projects, dependent: :destroy
  has_many :projects, through: :group_project_relations, dependent: :destroy
  ######################################################################################################################
end
