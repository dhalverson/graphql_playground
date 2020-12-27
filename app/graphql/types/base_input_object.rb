module Types
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class Types::BaseArgument
  end

  class Types::UserAttributes < Types::BaseInputObject
    description "Attributes for creating or updating a user"
    argument :name, String, "Name of the user", required: true
    argument :email, String, "Email of the user", required: true
  end
end
