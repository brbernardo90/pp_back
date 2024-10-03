class ApartmentsController < ApplicationController
    before_action :set_apartment, only: [:show, :update, :destroy, :details]
  
    # GET /apartments
    def index
      @apartments = Apartment.all
      render json: @apartments
    end
  
    # GET /apartments/:id
    def show
      render json: @apartment
    end
  
    # POST /apartments
    def create
      @apartment = Apartment.new(apartment_params)
  
      if @apartment.save
        render json: @apartment, status: :created, location: @apartment
      else
        render json: @apartment.errors, status: :unprocessable_entity
      end
    end
  
    # PUT /apartments/:id
    def update
      if @apartment.update(apartment_params)
        render json: @apartment
      else
        render json: @apartment.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /apartments/:id
    def destroy
      @apartment.destroy
      head :no_content
    end

    def details
      residents_with_relationships = @apartment.apartment_residents.includes(:resident).map do |rel|
          {
              id: rel.resident.id,
              name: rel.resident.name,
              phone: rel.resident.phone,
              relationship: rel.relationship_type.capitalize,
              start_date: rel.start_date,
              end_date: rel.end_date
          }
      end

      render json: {
          id: @apartment.id,
          block: @apartment.block,
          number: @apartment.number,
          residents: residents_with_relationships
      }
  end

  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def apartment_params
      params.require(:apartment).permit(:block, :number)
    end
  end
  