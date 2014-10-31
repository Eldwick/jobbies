class Application < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :job
  belongs_to :user
  accepts_nested_attributes_for :tasks

  def status_options
    ["Not Started", "Researching Company", "Informational Outreach", "Preparing Documents", "Phone Interview","Take Home Code Challenge", "Technical Interview", "Waiting for Offer"]
  end

  def pending_tasks
    tasks.where(pending: true)
  end

  def completed_tasks
    tasks.where(pending: false)
  end
end
