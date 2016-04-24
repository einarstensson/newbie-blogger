class AuthorSeeder
  def self.run
    Author.create(author: "Spock", authorslogan: "Live long and prosper", blogtitle: "Spock's Blog", author_description: "I am Spock, space explorer.")
  end
end