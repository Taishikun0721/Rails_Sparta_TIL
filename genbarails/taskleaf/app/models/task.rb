class Task < ApplicationRecord
  paginates_per 15
  # ページネーションの表示上限を設定
  before_validation :set_nameless_name
  validates :name, presence: true, length: { maximum: 30 }
  validates :name, uniqueness: true, unless: :used_set_nameless_name?
  validate :validate_name_not_including_comma

  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }
  # scopeを使用して、ヘルパーメソッドを定義

  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    %w(name created_at)
  end

  def self.racsackable_associations(auth_object = nil)
    []
  end

  def self.csv_attributes
    %w[name description created_at updated_at]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      self.all.each do |task|
        csv << csv_attributes.map { |attr| task.send(attr) }
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      task = self.new
      task.attributes = row.to_hash.slice(*csv_attributes)
      if task.valid?
        return task.tap(&:save)
      else
        return task
      end
    end
  end
  # import機能を実装

  private

  def validate_name_not_including_comma
    errors.add(:name, 'nameにカンマを含める事はできません') if name&.include?(',')
  end

  def set_nameless_name
    self.name = '名前なし' if name.blank?
  end

  def used_set_nameless_name?
    self.name == '名前なし'
  end
end
