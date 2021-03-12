# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def create_day(n)
    Day.create(date: (Time.zone.now + n.day).to_datetime.strftime("%Y-%m-%d"),
               created_at: Time.zone.now + n.day,
               updated_at: Time.zone.now + n.day)
end

Organisation.create( name: 'Non-organisation',
                     email: 'admin@admin.com',
                     description: 'Organisation for admin')

Menu.create( title: 'Daily menu')

case Rails.env
when 'development'
  0.upto(15) { |n| create_day(n) }
  (-1).downto(-15) { |n| create_day(n) }
when 'production'
  0.upto(15) { |n| create_day(n) }
  (-1).downto(-15) { |n| create_day(n) }
end
