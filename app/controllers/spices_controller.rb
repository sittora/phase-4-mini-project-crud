class SpicesController < ApplicationController

      def index
        spices = Spice.all
        render json: spices
      end
    
      # POST /spices
      def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
      end
    
      # GET /spices/:id
      def show
        spice = spice_param
        if spice
          render json: spice
        else
          render json: { error: "spice not found" }, status: :not_found
        end
      end
    
      # PATCH /spices/:id
      def update
        spice = spice_param
        if spice
          spice.update(spice_params)
          render json: spice
        else
          render json: { error: "spice not found" }, status: :not_found
        end
      end

      def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
          spice.destroy
          head :no_content
        else
          render json: { error: "Spice not found" }, status: :not_found
        end
      end

      private

      def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
      end

      def spice_param
        Spice.find_by(id: params[:id])
      end
end
