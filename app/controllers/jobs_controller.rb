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

  def anzeigen_show
    @jobs = Job.where(user_id: current_user.id)
  end

  def company_show
    @company = User.find(params[:id])
  end

  def new
    if current_user.role == "company"
      @job = Job.new
    else
      redirect_to jobs_index_path
    end
  end

  def create
    @job = Job.new(job_params)
    @job.user_id = current_user.id
    @job.save!

    # no need for app/views/restaurants/create.html.erb
    redirect_to job_path(@job)
  end

  def edit
    if current_user.id = Job.find(params[:id]).user_id
      @job = Job.find(params[:id])
    else
      redirect_to job_path(params[:id])
    end
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    redirect_to job_path(@job)
  end

  def archiv
    @jobs = Job.where(user_id: current_user)
  end

  def archiv_job
    @job = Job.find(params[:id])
    @job.hiring = "archiv"
    @job.save!
    redirect_to anzeigen_path
  end

  def active_job
    @job = Job.find(params[:id])
    @job.hiring = "Keine Angabe"
    @job.save!
    redirect_to edit_job_path(@job.id)
  end

  private

  def job_params
    params.require(:job).permit(:name, :address, :description, :hiring)
  end
end
