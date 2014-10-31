class Task < ActiveRecord::Base
  belongs_to :application
  belongs_to :contact
end
