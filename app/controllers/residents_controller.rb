class ResidentsController < ApplicationController
    before_action :set_resident, only: [:show, :update, :destroy, :details] 

    def index
        @residents = Resident.all
        render json: @residents
    end

    def create
        @resident = Resident.new(resident_params)

        if @resident.save
            render json: @resident, status: :created
        else
            render json: @resident.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: @resident
    end

    def update
        render json: @resident
    end

    def destroy
        render json: @resident
    end

    def details
        apartments_with_relationships = @resident.apartment_residents.includes(:apartment).map do |rel|
            {
                id: rel.apartment.id,
                block: rel.apartment.block,
                number: rel.apartment.number,
                relationship: rel.relationship_type.capitalize,
                start_date: rel.start_date,
                end_date: rel.end_date
            }
        end

        render json: {
            id: @resident.id,
            name: @resident.name,
            phone: @resident.phone,
            apartments: apartments_with_relationships
        }
    end

    private

    def set_resident
        @resident = Resident.find_by(id: params[:id])
    end

    def resident_params
        params.require(:resident).permit(:name, :phone)
    end
end