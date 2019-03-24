class Users::RegistrationsController < Devise::RegistrationsController
  before_action :select_plan, only: :new
  
  def create
    
    # Extend default devise gem behaviour so that
    # users signing up with pro account save with Stripe subscription function
    # Otherwise users sign up as usual.
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end
  
  private
    def select_plan 
      unless (params[:plan] == '1' || params[:plan] == '2')
        flash[:notice] = "Please select a membership plan to sign up."
        redirect_to root_url
      end
    end
end