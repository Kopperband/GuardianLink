# db/seeds.rb

# Clear existing data
User.destroy_all

# Create sample users
User.create!(
  email: "nonprofit@example.com",
  password: "password", # Use `password` instead of `encrypted_password`
  password_confirmation: "password",
  reset_password_token: nil,
  reset_password_sent_at: nil,
  remember_created_at: nil,
  created_at: Time.now,
  updated_at: Time.now,
  first_name: "John",
  last_name: "Doe",
  background_check: true,
  hours_per_week: 40,
  point_of_contact_email: "contact1@example.com",
  organization_name: "Organization One",
  areas_of_concern: "Concern A",
  role: 1,
  linkedin: "http://linkedin.com/in/johndoe"
)

User.create!(
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password",
  reset_password_token: nil,
  reset_password_sent_at: nil,
  remember_created_at: nil,
  created_at: Time.now,
  updated_at: Time.now,
  first_name: "Jane",
  last_name: "Smith",
  background_check: false,
  hours_per_week: 30,
  point_of_contact_email: "contact2@example.com",
  organization_name: "Organization Two",
  areas_of_concern: "Concern B",
  role: 2,
  linkedin: "http://linkedin.com/in/janesmith"
)

User.create!(
  email: "volunteer@example.com",
  password: "password",
  password_confirmation: "password",
  reset_password_token: nil,
  reset_password_sent_at: nil,
  remember_created_at: nil,
  created_at: Time.now,
  updated_at: Time.now,
  first_name: "Alice",
  last_name: "Johnson",
  background_check: true,
  hours_per_week: 20,
  point_of_contact_email: "contact3@example.com",
  organization_name: "Organization Three",
  areas_of_concern: "Concern C",
  role: 0,
  linkedin: "http://linkedin.com/in/alicejohnson"
)

puts "Seeded #{User.count} users."
