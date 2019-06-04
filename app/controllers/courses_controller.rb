class CoursesController < ApplicationController
  before_action :current_course, only: [:edit,:update]
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :upvote, :downvote]
  before_action :find_location_and_category, only: [:index, :current, :show]

  
  def index
    @courses = Course.all
    if params[:category_id].present?
      @courses = @courses.by_category(params[:category_id])
    end
    if params[:location_id].present?
      @courses = @courses.by_location(params[:location_id])
    end
  end

  
  def current
    @courses = current_user.courses.all
  end

  
  def show
    @course = Course.find_by_random_id!(params[:id])
  end

  def upvote
    @course = Course.find_by_random_id(params[:id])
    if @course.votes.count > 0
      flash[:danger] = "You can only vote a course once!"
      redirect_to(current_courses_path)
    else 
      @course.votes.create 
      redirect_to(courses_path)
    end
  end

  
  def downvote
    @course = Course.find_by_random_id(params[:id])
    if @course.numbers.count === 0
       @course.numbers.create 
       redirect_to(courses_path)
    else 
      flash[:danger] = "You can only vote a course once!"
      redirect_to(current_courses_path)
    end
  end


  def new
    @course = current_user.courses.new
  end

  def create
    @course = current_user.courses.create!(course_params)

    if @course.save
      flash[:success] = "Course created!"
      redirect_to @course
    else
      render "new"
    end
  end

  
  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to courses_path
    else
      render "edit"
    end
  end

  protected

  def current_course
    @course = current_user.courses.find_by_random_id!(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :description, :prerequisite, :random_id,:category_id, :remove_images, :location_id, :images => [] )
  end
end
