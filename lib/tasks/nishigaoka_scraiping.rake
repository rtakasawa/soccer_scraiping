desc "This task is called by the Heroku scheduler add-on"
task :nishigaoka_scraiping => :environment do
  Nishigaoka.scraiping
end
