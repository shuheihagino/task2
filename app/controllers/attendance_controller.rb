class AttendanceController < ApplicationController
    before_action :authenticate_user!
    before_action :set_entry, only: [:show, :edit, :update, :destroy]
  def start
   
  end

  def finish
    
  end

  def attendance
    @start_time = Attendance.create(user_id: current_user.id, start_time: Time.current)
    render action: :finish
  end

  def leave
    @end_time = Attendance.create(user_id: current_user.id, end_time: Time.current)
    render action: :start
  end

  def index 
    @time = Attendance.all
    @time = @time.where(user_id: current_user.id)
  end
  
  def destroy
    @time.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    #Attendance.find(params[:id]).destroy
   # render action: :index
    end
  end

end
