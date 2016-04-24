# ------ Require Bundler so that the gems can be installed ------
require 'bundler/setup'
Bundler.require

# ------ Require Gems used in this blog ------
require 'active_record'
require 'pry'
require 'erb'

# ------ Require the blog generator ------
require "./lib/support/blog_generator.rb"

# ------ Require Models ------
#The Blog Author Meta Data
require "./app/models/author/Author.rb"

#The Posts
require "./app/models/post/Post.rb"

# ------ Require Models ------
require "./db/seeds/posts.rb"
require "./db/seeds/authors.rb"

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/blog_database.db"
)

DOMAIN = "file:///Users/hlpolivy/Desktop/flatiron/newbie-blog/"

INDEX_TEMPLATE = File.open("./app/views/index.html.erb")
POST_TEMPLATE = File.open("./app/views/post/post.html.erb")

