require_relative '../../config/environment'

describe 'calculator' do
  it 'should get the right handicap' do
    test_course = Course.new(name: "test", slope: 143, course: 74)
    scores = [78, 72]
    result = test_course.calculate(scores)
    expect(result).to eq(0.96)
  end
end
