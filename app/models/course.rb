class Course < ActiveRecord::Base
  has_many :scores

  def calculate(scores)
    total = []
    scores.each do |score|
      total <<((score.to_f-course.to_f*113/slope.to_f))
    end
    final = total.inject(:+)*(0.96)
    return (final*slope/113).round(2)
  end

end
