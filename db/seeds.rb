require 'factory_bot_rails'

# User.create(email: 'boichenko.yaroslav@gmail.com', password: '123123123', password_confirmation: '123123123')

5.times do
  FactoryBot.create(:job)
  # job = Job.create(title: Faker, description: "", quantity: rand(1..10))
  #
  # rand(1..5).times do
  #   job.job_times.create(total_hours: rand(1..10))
  # end
  #
  # rand(1..3).times do
  #   job.job_hardware_items.create(title: Faker::Color.color_name)
  # end
end