class CepController < ApplicationController
  
    def show
      @cep = CEP.new(params[:cep])
      respond_to do |format|
        format.js { render layout: false }
      end
    end
    
end  