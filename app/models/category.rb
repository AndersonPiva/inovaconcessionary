class Category < ActiveRecord::Base
  has_many :vehicles, :dependent => :destroy

  searchkick autocomplete: ['name']
end
