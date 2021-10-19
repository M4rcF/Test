class AddressesController < ApplicationController
    def show
      @address = Person.find(params[:person_id]).address
      render json: @address
    end  
end  