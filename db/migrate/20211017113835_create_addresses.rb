class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :logradouro
      t.string :complemento
      t.string :bairro
      t.string :localidade
      t.string :uf
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
