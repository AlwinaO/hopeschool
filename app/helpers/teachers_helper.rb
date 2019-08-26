module TeachersHelper

  def display_grade_format(teacher)
    if teacher.teacher_semesters.exists?
      content_tag(:h4, teacher.teacher_semesters.grade_format)
    else
      content_tag(:h4, "Teacher Grade not available, please click below to add a grade.")
    end
  end
end
