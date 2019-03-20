class KittensController < ApplicationController
    def index 
        @kittens = Kitten.all
        respond_to do |format|
            format.html # index.html.erb
            format.xml  { render :xml => @kittens }
            format.json { render :json => @kittens }
        end
    end

    def new 
        @kitten = Kitten.new
    end

    def create
        @kitten = Kitten.create(kitten_params)
        flash[:success] = "New kitten created"
        redirect_to root_path
    end

    def show
        @kitten = Kitten.find(params[:id])
    end

    def edit 
        @kitten = Kitten.find(params[:id])
    end

    def update 
        @kitten = Kitten.find(params[:id])
        @kitten.update_attributes(kitten_params)
        flash[:update] = "Kitten updated"
        redirect_to root_path
    end

    def destroy
        @kitten = Kitten.find(params[:id])
        @kitten.delete
        flash[:success] = "Kitten deleted"
        redirect_to root_path
    end

    private

    def kitten_params
        params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
