class Todo < ApplicationRecord
    belongs_to :category, optional: true
    
    validates :title, presence: true
    validates :status, presence: true
    validates :priority, presence: true
    validates :priority, numericality: { 
        only_integer: true,
        greater_than_or_equal_to: 0,
        less_than_or_equal_to: 5
    }
end