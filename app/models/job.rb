class Job < ActiveRecord::Base
  belongs_to :company
  has_many :applications
  has_many :users, through: :applications
  has_many :tasks, through: :applications
  geocoded_by :address

  def address
    return nil if location == 0
    [location].compact.join(', ')
  end 

  def self.search(search)
    if !(search[:company_id] == '' || search[:company_id] == nil) 
      where("lower(name) like ? AND lower(location) like ? AND company_id = ?", "%#{search[:name].downcase}%", "%#{search[:location]}%", "#{search[:company_id]}").uniq
    else
      where("(lower(name) like ? OR lower(description) like ?) AND lower(location) like ?", "%#{search[:name].downcase}%", "%#{search[:name].downcase}%", "%#{search[:location]}%",).uniq
    end
        
  end
end
