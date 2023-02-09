class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :error_not_found

def index
  spice = Spice.all
  render json: spice
end


def create
spice = Spice.create(permitted_params)
render json: spice, status: :created
end

def update
spice = find_spice
spice.update(permitted_params)
render json: spice, status: :ok
end

def destroy
spice = find_spice
spice.destroy
head :no_content
end






private

def permitted_params
  params.permit(:title, :image, :description, :notes, :rating)
end

def find_spice
  Spice.find(params[:id])
end

def error_not_found
  render json: {error: "UHH OHH NOT FOUND"}

end


end
