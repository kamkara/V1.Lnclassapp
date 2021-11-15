class EnrollmentsController < ApplicationController
  def create
    if !curent_user.enrolled_classes.exists?(params[:classroom_id])
      current_user.enrolled_classes << Classroom.friendly.find(params[:classroom_id])
      redirect_to root_path and return
    end
    flash.notice = ["vous etes deja dans une classe"]
    redirect_to fallback_location: classrooms_path()
  end

  def destroy
      #authorize :enrollment, :destroy?
      current_user.enrolled_classes.delete.Classroom.friendly.find(params[:id]))
      redirect_to dashboards_path()
  end

end


