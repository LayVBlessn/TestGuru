class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[edit update destroy]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      flash[:notice] = 'Badge was created!'
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @badge.update(badge_params)
      flash[:notice] = 'Badge was updated!'
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    flash[:notice] = 'Badge was destroyed!'
    redirect_to admin_badges_path
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :image, :rule, :challenge)
  end
end
