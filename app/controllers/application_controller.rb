class ApplicationController < ActionController::Base
    #Add pundit for authorize
    include Pundit

     protect_from_forgery with: :exception
    #login params
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :find_levels
    before_action :find_schools

  protected
    # If you have extra params to permit, append them to the sanitizer.
    def configure_permitted_parameters
    sign_up_params          = [ :first_name, :last_name, :full_name, :matricule, :level_id, :material_id, :school_id, :contact, :city, :role,
                              :email, :password, :slug, :gender]
    update_sign_up_params  = [ :school_name, :status, :avatar_profil, :status_payment]
     
    devise_parameter_sanitizer.permit :sign_up, keys: sign_up_params
      devise_parameter_sanitizer.permit :account_update, keys: update_sign_up_params
      devise_parameter_sanitizer.permit :sign_in, keys: [:logged, :password]
    end 

    private
      def find_levels
        @levels = Level.all
      end
      
      def find_schools
        @schools = School.all
      end
end
