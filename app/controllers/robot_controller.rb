class RobotController < ApplicationController
  before_action :set_robot
  before_action :validate_placement

  def index
  end

  def place
    @robot.place (params[:x] || 0), (params[:y] || 0), Robot::North
    @robot.save
    
    forward_to_view
  end

  def move
    if @robot.move?
      @robot.save
    else
      flash[:danger] = "Couldn't move!"
    end

    forward_to_view
  end

  def left
    @robot.left?
    @robot.save
    
    forward_to_view
  end

  def right
    @robot.right?
    @robot.save
    
    forward_to_view
  end

  def report
    flash[:success] = @robot.report

    forward_to_view
  end

private

  def set_robot
    @robot = Robot.find(session[:robot])
  rescue ActiveRecord::RecordNotFound
    @robot ||= Robot.create

    session[:robot] = @robot.id
  end

  def validate_placement
    params[:x] = params[:x].to_i
    params[:y] = params[:y].to_i
  end

  def forward_to_view
    respond_to do |format|
      format.html { redirect_to robot_index_path }
    end
  end

end
