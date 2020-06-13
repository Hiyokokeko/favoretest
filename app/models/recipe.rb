class Recipe < ApplicationRecord
  belongs_to :user #アソシエーション
  has_many :favorites, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :body
  end
end
