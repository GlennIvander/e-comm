class Product < ApplicationRecord
  # has_many_attached :images do |attachable|
  #   attachable.variant :thumb, resize_to_limit: [ 50, 50 ]
  # end

  has_one_attached :images

  belongs_to :category
  has_many :stocks
end
