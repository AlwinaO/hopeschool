module FormHelper
  def setup_teacher(teacher)
    teacher.classroom ||= Classroom.new
    (Semester.all - teacher.semesters).each do |semester|
      teacher.teacher_semesters.build(:semester => semester)
    end
    # teacher.teacher_semesters.sort_by {|s| s.semester.id}

    teacher
  end
end
