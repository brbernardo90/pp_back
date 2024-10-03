class ApartmentResidentsController < ApplicationController
    before_action :set_apartment_resident, only: [:show, :update, :destroy]

    # GET /apartment_residents
    def index
      @apartment_residents = ApartmentResident.all
      render json: @apartment_residents
    end
  
    # GET /apartment_residents/:id
    def show
      render json: format_apartment_resident(@apartment_resident)
    end
  
    # POST /apartment_residents
    def create
      @apartment_resident = ApartmentResident.new(apartment_resident_params)
    #   debugger
      if @apartment_resident.save
        render json: @apartment_resident, status: :created
      else
        render json: @apartment_resident.errors, status: :unprocessable_entity
      end
    end
  
    # PUT /apartment_residents/:id
    def update
      if @apartment_resident.update(apartment_resident_params)
        render json: @apartment_resident
      else
        render json: @apartment_resident.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /apartment_residents/:id
    def destroy
      @apartment_resident.destroy
      head :no_content
    end
  
      # GET /residents/:id/apartment_residents
    def by_resident
        @resident = Resident.find(params[:resident_id])
        @apartment_residents = @resident.apartment_residents.includes(:apartment)

        render json: @apartment_residents.map { |ar| format_apartment_resident(ar) }
    end

    # GET /apartments/:id/apartment_residents
    def by_apartment
        @apartment = Apartment.find(params[:apartment_id])
        @apartment_residents = @apartment.apartment_residents.includes(:resident)

        render json: @apartment_residents.map { |ar| format_apartment_resident(ar) }
    end
    private

    # Helper method to format the response data
    def format_apartment_resident(ar)
        {
        id: ar.id,
        resident: {
            id: ar.resident.id,
            name: ar.resident.name,
            phone: ar.resident.phone
        },
        apartment: {
            id: ar.apartment.id,
            block: ar.apartment.block,
            number: ar.apartment.number
        },
        relationship_type: ar.relationship_type.capitalize,
        start_date: ar.start_date,
        end_date: ar.end_date || 'Present'
        }
    end
  
    def set_apartment_resident
      @apartment_resident = ApartmentResident.find(params[:id])
    end
  
    def apartment_resident_params
      params.require(:apartment_resident).permit(:apartment_id, :resident_id, :relationship_type, :start_date, :end_date)
    end
end
