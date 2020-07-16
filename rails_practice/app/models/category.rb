class Category < ApplicationRecord
    has_many :todos
    validates :name, presence: true
    validates :description, presence: true
end
