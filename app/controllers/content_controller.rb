

class ContentController < ApplicationController
  before_filter :authenticate_user!

  def silver
    authorize! :view, :silver, :message => 'Access limited to Silver Plan subscribers.'
  end

  def gold
    authorize! :view, :gold, :message => 'Access limited to Gold Plan subscribers.'
  end

  def platinum
    authorize! :view, :platinum, :message => 'Access limited to Platinum Plan subscribers.'
  end
end

##alternate authorization not using CanCan (honestly I think it's a tad easier to understand at this point in time)

#class ContentController < ApplicationController
#  before_filter :authenticate_user!
#
#  def silver
#    if (current_user.has_role? :silver) || (current_user.has_role? :admin)
#      render :silver
#    else
#      redirect_to :back, :notice => 'Access limited to Silver Plan subscribers.'
#    end
#  end
#
#  def gold
#   if (current_user.has_role? :gold) || (current_user.has_role? :admin)
#      render :gold
#    else
#      redirect_to :back, :notice => 'Access limited to Gold Plan subscribers.'
#    end
# end

#  def platinum
#    if (current_user.has_role? :platinum) || (current_user.has_role? :admin)
#      render :platinum
#    else
#      redirect_to :back, :notice => 'Access limited to Platinum Plan subscribers.'
#    end
#  end
#end