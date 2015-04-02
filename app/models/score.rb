class Score < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  # This needs to be here... object cant exist without this.
  validates_presence_of :strokes
end
