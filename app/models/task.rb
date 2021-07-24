class Task < ApplicationRecord

  include RankedModel
  ranks :row_order, with_same: :project_id
  #アソシエーション########################################################################################################
  belongs_to :create_user, class_name: 'User', foreign_key: :create_user_id
  belongs_to :project
  #アソシエーション終わり####################################################################################################
  
  #バリデーション##########################################################################################################
  with_options presence: true do
    validates :name
  end

  validates :content, length: { maximum: 1000 }
  #バリデーション終わり####################################################################################################

end

