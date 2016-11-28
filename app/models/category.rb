class Category < ActiveRecord::Base
  has_many :vehicles, :dependent => :destroy
end
