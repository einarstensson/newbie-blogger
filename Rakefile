require_relative './config/environment'

#Task: migrate the database
desc "Migrate the database on setup."
task :migrate do
  database_connection = { "adapter" => "sqlite3", "database" => "db/blog_database.db"}

  ActiveRecord::Base.establish_connection(database_connection)
  ActiveRecord::Migrator.migrate("db/migrations/")
end

# Seed the database with previous posts
task :seed do
  AuthorSeeder.run
  PostSeeder.run
end

# Generate the blog
task :generate, :response do |gen_task, args|
  blog_generator = BlogGenerator.new(args[:response])
  blog_generator.generate
end

#TODO: New post task: rake new_post
#TODO: A deploy task that uploads the generated blog to github pages.