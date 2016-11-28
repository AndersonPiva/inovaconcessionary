class Model < ActiveRecord::Base
  has_many :vehicles, :dependent => :destroy
  validates_presence_of :name
end
