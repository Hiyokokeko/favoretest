class Recipe < ApplicationRecord
  belongs_to :user #アソシエーション

  with_options presence: true do
    validates :title
    validates :body
  end
end
