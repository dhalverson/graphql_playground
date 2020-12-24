module Types
  class QueryType < Types::BaseObject
    field :get_users, [Types::UserType], null: false do
      description 'This will return all the users'
    end

    field :get_user, Types::UserType, null: false do
      description 'This will return a single user'
      argument :id, ID, required: true
    end

    def get_users
      User.all
    end

    def get_user(id:)
      User.find(id)
    end
  end
end
