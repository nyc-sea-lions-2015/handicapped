class Course < ActiveRecord::Base
  has_many :scores

  def calculate(scores)
    total = []
    scores.each do |score|
      total <<((score-course)*113/slope)
    end
    final = (total.inject(:+)/total.length)*(0.96)
    return (final*slope/113).round(2)
  end

end
