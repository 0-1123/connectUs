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
  end

  def update
  end
end
