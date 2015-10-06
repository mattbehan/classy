# class RegistrationsController < Devise::RegistrationsController
#     before_filter :sign_up_params
#
#     private
#
#     # my custom fields are :name, :heard_how
#     def sign_up_params
#       params.require(:teacher).permit(:first_name, :last_name, :email,
#                                         :password, :password_confirmation)
#
#     end
#
# end
