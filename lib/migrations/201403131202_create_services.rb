Sequel.migration do
  change do
    create_table(:services) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      String :name
    end
  end
end
