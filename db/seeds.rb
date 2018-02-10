# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'example.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Topics.new
  t.id = row['id']
  t.title = row['title']
  t.description = row['description']
  t.created_at = row['created_at']
  t.updated_at = row['updated_at']
  t.save
  puts "#{t.title}, #{t.description} saved"
end

puts "There are now #{Topics.count} rows in the topics table"