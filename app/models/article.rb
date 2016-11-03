class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true
  validates :user_id, numericality: true, uniqueness: true

  before_validation :fill_title

  private

  def fill_title
    if title.nil? && !body.nil?
      self.title = body.split(" ").take(2).join(" ")
    end
  end
end
