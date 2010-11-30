class Post < ActiveRecord::Base
  has_many :comments,:dependent => :destroy
  has_many :tags 
  
  validates :name,  :presence => true
  validates :title, :presence => true,
		            :length => { :minimum => 5 }

  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

end
