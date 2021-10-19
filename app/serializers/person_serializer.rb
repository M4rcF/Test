class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :age
  has_one :address do 
    link(:related) { person_address_url(object.id) }
  end
end
