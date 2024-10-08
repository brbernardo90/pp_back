class DeliveriesController < ApplicationController
    before_action :set_apartment, except: [:index, :show, :find_by_reader_code]
    before_action :set_delivery, only: [:show, :update, :destroy]
  
    # GET /apartments/:apartment_id/deliveries
    def index
    #   @deliveries = @apartment.deliveries
      @deliveries = Delivery.all
      render json: @deliveries
    end
  
    # GET /apartments/:apartment_id/deliveries/:id
    def show
      

      render json: @delivery
    end

      # GET /deliveries/find_by_reader_code/:reader_code
    def find_by_reader_code
        @delivery = Delivery.find_by(reader_code: params[:reader_code])

        if @delivery
            render json: @delivery
        else
            render json: { error: 'Delivery not found' }, status: :not_found
        end
    end
  
    # POST /apartments/:apartment_id/deliveries
    def create
      @delivery = @apartment.deliveries.build(delivery_params)
  
      if @delivery.save
        render json: @delivery, status: :created # location: [@apartment, @delivery]
      else
        render json: @delivery.errors, status: :unprocessable_entity
      end
    end
  
    # PUT /apartments/:apartment_id/deliveries/:id
    def update
      if @delivery.update(delivery_params)
        render json: @delivery
      else
        render json: @delivery.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /apartments/:apartment_id/deliveries/:id
    def destroy
      @delivery.destroy
      head :no_content
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
    #   debugger
      @apartment = Apartment.find(params[:apartment_id])
    end
  
    def set_delivery
      
      @delivery = @apartment.deliveries.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def delivery_params
      params.require(:delivery).permit(:block, :number, :received_at, :reader_code, :apartment_id, :status)
    end
end
  