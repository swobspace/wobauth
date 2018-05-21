class Categories::AuthoritiesController < Wobauth::AuthoritiesController
  before_action :set_authorized_for

private

  def set_authorized_for
    @authorized_for = Category.find(params[:category_id])
  end
end
