class Vehicle < ActiveRecord::Base
  belongs_to :model
  belongs_to :category
  has_many :optionals, :dependent => :destroy
  has_many :images, :dependent => :destroy

  accepts_nested_attributes_for :optionals
  accepts_nested_attributes_for :images

  validates_presence_of :title

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
