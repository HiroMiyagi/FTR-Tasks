class Project < ApplicationRecord

    #アソシエーション########################################################################################################
    belongs_to :create_user, class_name: 'User', foreign_key: :create_user_id
    has_many :tasks, dependent: :destroy
    has_many :group_project_relations
    has_many :projects, through: :group_project_relations
  #アソシエーション終わり####################################################################################################

    #バリデーション##########################################################################################################
    with_options presence: true do
      validates :name
      validates :job_num
      validates :order_amount
      validates :delivery_date
    end
    #バリデーション終わり####################################################################################################

end


