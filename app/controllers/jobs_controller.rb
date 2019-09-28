class JobsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = " \
        jobs.name ILIKE :query \
        OR jobs.address ILIKE :query \
        OR jobs.description ILIKE :query \
        OR users.name ILIKE :query \
      "
      @jobs = Job.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @jobs = Job.all
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def company_show
    @company = User.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
