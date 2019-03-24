class Users::RegistrationsController < Devise::RegistrationsController
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
end