class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :applications
  has_many :tasks, through: :applications
  has_many :jobs, through: :applications
  geocoded_by :address 

  def address
    [street_address, city, state, zip_code].compact.join(', ')
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end

  def pending_tasks
    tasks.where(pending: true)
  end
end
