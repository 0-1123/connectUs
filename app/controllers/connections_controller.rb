class ConnectionsController < ApplicationController
  def show
    @connections = Connection.where(user_id: current_user.id)
  end

  def new
    @connection = Connection.new
    @connection.user_id = current_user.id
    @connection.job_id = params[:id]
    @connection.status = "Offen"
    @connection.save!
    redirect_to jobs_index_path
  end

  def edit
    jobs = Job.where(user_id: current_user.id)
    connect = []
    jobs.each do |job|
      connect << Connection.where(job_id: job.id)
    end
    @connections = connect.flatten
  end

  def update
    @connection = Connection.find(params[:id])
    @connection.update(connection_params)
    redirect_to edit_connection_path
  end

  def remove
    @connection = Connection.find(params[:id])
    @connection.status = "Remove"
    @connection.save!
    if current_user.role == "company"
      redirect_to edit_connection_path
    else
      redirect_to connections_path
    end
  end

  private

  def connection_params
    params.require(:connection).permit(:status)
  end
end
