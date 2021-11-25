class HomeController < ApplicationController
  before_action :find_levels
  before_action :find_materials
   
  def index
    @materials    = Material.all.order('created_at desc')
    if :student?
      @feed_courses = Course.where('level_id = ?', current_user.level_id).order('created_at desc') and return if :student?
    elsif :teacher?
      @feed_courses = Course.where('material_id = ?', current_user.material_id).order('created_at desc')  and return if :teacher?
    else :team?
      @feed_courses = Course.all.order('created_at desc')  and return if :teacher?
    end

  end

  def show
  end

  def enseignant
  end

  private
      def find_levels
        @levels = Level.all
      end
  
      def find_materials
        @materials = Material.all
      end
  end
