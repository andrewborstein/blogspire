namespace :db do
  desc "Destroy all blogs that random visitors have added."
  task :reset do
    blogs = Blog.where.not(id: [1,2,3])
    count = blogs.length

    blogs.destroy_all

    puts "Destroyed #{count} blogs."
  end
end
