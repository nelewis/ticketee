# This file should contain all the record creation needed to seed the database with its default values.



# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


# these are db:drop db:create db:migrate db:seed db:test:prepare



admin_user = User.create(:email => "admin@gmail.com",



                         :password => "password")



admin_user.admin = true



admin_user.confirm!



admin_user2 = User.create(:email => "user@gmail.com",



                          :password => "password")



admin_user2.admin = false



admin_user2.confirm!





Project.create([



                 {:name =>"Seed 1st project", :description=>"Seed 1st projects description"}



])
Permission.create([



                    {:user =>1, :action=>"view", :thing=>1}



])


#Ticket.create ([

#

#                 {:title =>"Seed 1st ticket", :description=>"Seed 1st projects ticket description", :project_id=>1, :user_id=>1}

#

#])
