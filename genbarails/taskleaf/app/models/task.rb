class Task < ApplicationRecord
  before_validation :set_nameless_name
  validates :name, presence: true, uniqueness: true
  validates :name, length: { maximum: 30 }
  validate :validate_name_not_including_comma

  belongs_to :user

  private

  def validate_name_not_including_comma
    errors.add(:name, 'nameにカンマを含める事はできません') if name&.include?(',')
  end

  def set_nameless_name
    self.name = '名前なし' if name.blank?
  end
end