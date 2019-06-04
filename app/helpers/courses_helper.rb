module CoursesHelper
  
  def course_filters(options)
    params.permit(:location_id, :category_id).merge(options)
  end
end
