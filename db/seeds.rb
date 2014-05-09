# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
40.times do |i|
  @project = Project.create!(
    name: i.to_s + ' - Accelerated Monkey wheels',
    description: "The most accelerated monkey wheels ever made!!!!!!!!!!!111",
    start_date: Date.today,
    finish_date: Date.today + 30,
    funding_goal: 500,
    user_id: 1
  )

  @project.tiers.create!(
    user_id: 1,
    amount: 50,
    tier_description: "The best thing in the world is this tier!"
  )

  @project.tiers.create!(
    user_id: 1,
    amount: 100,
    tier_description: "The EVEN best thing in the world is this tier!"
  )
end


