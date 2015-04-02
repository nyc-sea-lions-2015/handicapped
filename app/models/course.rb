class Course < ActiveRecord::Base
  has_many :scores

  ## Move some numbers into constants:
  COEFFICIENT_OF_STROKULARITY = 113
  BARGLE_MAGIC_NUMBER = 0.96

  ## Add some validations here too!!

  def calculate(scores)
    total = []
    scores.each do |score|
      # Use constants instead of embedding numbers everywhere.
      total << ((score-course) * COEFFICIENT_OF_STROKULARITY / slope)
    end
    final = (total.inject(:+)/total.length)*(BARGLE_MAGIC_NUMBER)
    return (final*slope/COEFFICIENT_OF_STROKULARITY).round(2)
  end

end
