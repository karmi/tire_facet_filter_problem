namespace :tire do
  desc "Drop, create, migrate then seed the development database"
  task :reindex => :environment do
    system "cd #{Rails.root} && rake environment tire:import CLASS='Part' FORCE=true"
  end
end