namespace :db do
  # bundle exec rake db:reset_default_data
  desc "Destroy all blogs that random visitors have added."
  task :reset_default_data => [:environment] do
    blogs = Blog.where.not(id: [1,2,3])
    count = blogs.length

    blogs.destroy_all

    puts "Successfully destroyed #{count} blogs."
  end
end
