class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def show
        @e = Employee.find_by(id: params[:id])
    end

    def new
        @e = Employee.new
    end

    def create
        @e = Employee.new(e_params)
        if @e.save
            redirect_to employee_path(@e)
        else
            render :new
        end
    end

    private

    def e_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end

end
