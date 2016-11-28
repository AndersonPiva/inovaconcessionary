class Model < ActiveRecord::Base
  has_many :vehicles, :dependent => :destroy
  searchkick autocomplete: ['name']
  validates_presence_of :name
end
