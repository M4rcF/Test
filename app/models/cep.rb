require 'net/http'

class CEP
    attr_reader :cep, :logradouro, :complemento, :bairro, :localidade, :uf

    def initialize(cep)
        c = info(cep)
        @cep = c["cep"]
        @logradouro = c["logradouro"]
        @complemento = c["complemento"]
        @bairro = c["bairro"]
        @localidade = c["localidade"]
        @uf = c["uf"]
    end

    private

    def info(cep)
      ActiveSupport::JSON.decode(
        Net::HTTP.get(
          URI("https://viacep.com.br/ws/#{cep}/json/")
        )
      )
    end

end