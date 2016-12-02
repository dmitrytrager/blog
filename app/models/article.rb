class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :commenters, through: :comments

  validates :title, presence: true, uniqueness: true
  validates :user_id, numericality: true

  before_validation :fill_title

  def last_comment_from(commenter)
    comments
      .where(user_id: commenter.id)
      .order(created_at: :asc)
      .last
  end

  private

  def fill_title
    if title.nil? && !body.nil?
      self.title = body.split(" ").take(2).join(" ")
    end
  end
end
