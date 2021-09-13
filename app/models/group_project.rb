class GroupProject

  include ActiveModel::Model
  attr_accessor :name, :job_num, :order_amount, :delivery_date, :create_user_id, :group_id

  with_options presence: true do
    validates :name
    validates :job_num
    validates :order_amount
    validates :delivery_date
    validates :create_user_id
    validates :group_id
  end

  def save
    project = Project.create(name: name, job_num: job_num,  order_amount: order_amount, delivery_date: delivery_date, create_user_id: create_user_id)
    GroupProjectRelation.create(group_id: group_id, project_id: project.id)
  end

  # def group_destroy
  #   GroupProjectRelation.destroy(group_id: group_id)
  # end
end