user1 = User.create(username: "slo", password: "password1")


course = Course.create(name: "Harding", course: 74, slope: 129)

score = Scores.create(user_id: 1, course_id: 1, strokes: 72)
score2= Scores.create(user_id: 1, course_id: 1, strokes: 69)
