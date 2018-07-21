class Person
  include Mongoid::Document
  include Mongoid::Slug
  field :name
  slug :name, permanent: true, scope: :author
  embeds_many :relationships
  if Mongoid::Compatibility::Version.mongoid6? || Mongoid::Compatibility::Version.mongoid7?
    belongs_to :author, inverse_of: :characters, required: false
  else
    belongs_to :author, inverse_of: :characters
  end
end
