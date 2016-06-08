class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :company

  has_and_belongs_to_many :users

  accepts_nested_attributes_for :users

  validates   :comment,
              presence: true,
              :on => :create,
              length:{ maximum: 140 }
              
  validates   :rate,
              presence: true
end
