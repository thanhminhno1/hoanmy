  # This file should ensure the existence of records required to run the application in every environment (production,
  # development, test). The code here should be idempotent so that it can be executed at any point in every environment.
  # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
  #
  # Example:
  #
  [
    {
      name: "Ngoại",
      email: "ngoai"
    },
    {
      name: "Nhi",
      email: "nhi"
    },
    {
      name: "Nội",
      email: "noi"
    }
  ].each do |department|
    d = Department.find_or_create_by!(name: department[:name])

    User.find_or_create_by!(email: "#{department[:email].downcase}@yopmail.com") do |user|
      user.password = "password"
      user.department = d
    end
  end
