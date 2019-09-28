# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Connection.destroy_all
Job.destroy_all
User.destroy_all



puts 'Creating users...'
user_attributes = [
  {
    name:         'Autoverleih123',
    information:  'Ihre freundliche und kompetente Autovermietung im Raum Koblenz.',
    email:  'auto123@yahoo.de',
    password: 'test123',
    role: 'company'
  },
  {
    name:         'Pizza-Palaza',
    information:  'Die schnellste Pizza und der beste Service! Lassen Sie sich verwöhnen.',
    email:  'pizzap@yahoo.de',
    password: 'test123',
    role: 'company'
  },
  {
    name:         'Rhein-Pflege',
    information:  'Wir kümmern uns um Ihre Liebsten. Hingebungsvolle Pflege für jede Pflegestufe.',
    email:  'rhein-pflege@yahoo.de',
    password: 'test123',
    role: 'company'
  },
  {
    name:         'Emily Parmas',
    information:  'Ich bin in der 11. Klasse des Koblenz-Gymnasiums und möchte mich orientieren.',
    email:  'empa@yahoo.de',
    password: 'test123',
    role: 'user'
  },
  {
    name:         'Holger Ernst',
    information:  'Nach 20 Jahren auf dem Bau wird es Zeit für etwas neues!',
    email:  'ernstbau@yahoo.de',
    password: 'test123',
    role: 'company'
  }
]


User.create!(user_attributes)
puts 'Finished Users!'

puts "Generate Jobs!"

user1 = User.first

job1 = Job.new
job1.user_id = user1.id
job1.name = "Kaufmann für Automobile"
job1.description = "Der ganze Papierkram rund ums Auto. Werde Teil eines freundlichen Teams. Der tägliche Kundenkontakt sorgt für Abwechslung!"
job1.hiring = "yes"
job1.address = "Koblenz, Am Marktplatz 10"
job1.save!

job2 = Job.new
job2.user_id = user1.id
job2.name = "Engagierter Autopoliteur"
job2.description = "Bringen Sie Autos auf Hochglanz. Bei uns gibt es die neusten Modelle und wir sorgen für die nötige Pflege."
job2.hiring = "no"
job2.address = "Koblenz, Am Marktplatz 11"
job2.save!

user2 = User.where(name: "Pizza-Palaza")[0]

job3 = Job.new
job3.user_id = user2.id
job3.name = "Pizza-Bäcker"
job3.description = "Lernen Sie die Italienische Traditionskunst des Pizza-Backens! Nur hier nach original Rezept von 1920."
job3.hiring = "yes"
job3.address = "Koblenz, Allee des Essens 1"
job3.save!

job4 = Job.new
job4.user_id = user2.id
job4.name = "KellnerIN"
job4.description = "Sie sind freundlich, gesprächig und gerne auf den Beinen? Dann ist Kellnerin vielleicht Ihr Traumjob."
job4.hiring = "yes"
job4.address = "Neuwied, Allee des Essens 1"
job4.save!

user3 = User.where(name: "Rhein-Pflege")[0]

job5 = Job.new
job5.user_id = user3.id
job5.name = "Pflegefachkraft"
job5.description = "Gemeinsam Helfe ist unser Motto. Hier ist niemand alleine. Mit Kraft und Köpfchen betreuen wir alte und körperlich Eingeschränkte."
job5.hiring = "no"
job5.address = "Vallendar, Sterbetower 7"
job5.save!

puts "Created Job!"
