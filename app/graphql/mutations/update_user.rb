class Mutations::UpdateUser < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :attributes, Types::UserAttributes, required: true

  field :user, Types::UserType, null: false
  field :errors, [String], null: false

  def resolve(id:, attributes:)
    user = User.find(id)

    if user.update(attributes.to_h)
      { user: user }
    else
      raise GraphQL::ExecutionError, user.errors.full_messages.join(", ")
    end
  end
end