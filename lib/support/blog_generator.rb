class BlogGenerator
  attr_accessor :blog_name, :author, :posts

  def initialize(blog_name)
    @blog_name = blog_name
    @author = Author.all.first
  end

  def generate
    build_directories

    style_template = generate_style
    render(style_template)
    @post_templates = generate_posts
    index_template = generate_index

    render(@post_templates)
    render(index_template)
  end

  def render(templates)
    templates.each do |template|
      File.open("#{blog_name}#{template[:path]}", "w") do |file|
        file.write(template[:template])
      end
    end
  end

  def build_directories
    # Delete current blog version
    FileUtils.rm_rf(blog_name)

    # Create blog root folder.
    FileUtils.mkdir_p(blog_name)

    # Create posts directory
    FileUtils.mkdir_p(blog_name + "/posts/")

    # Create Stylesheet folder
    FileUtils.mkdir_p(blog_name + "/style/")
  end

  def generate_index
    index_template_file = INDEX_TEMPLATE.read

    path = "/index.html"
    template = ERB.new(index_template_file).result(binding)

    [ { path: path, template: template } ]
  end

  def generate_posts
    post_template_file = POST_TEMPLATE.read

    Post.all.map do |post|
      path = "/posts/#{post.title.gsub(' ', '-')}.html"
      template = ERB.new(post_template_file).result(binding { post })

      { path: path, template: template }
    end

  end

  def generate_style
    path = "/style/style.css"
    stylesheet_file = File.open(".#{path}","r").read

    [ { path: path, template: stylesheet_file } ]
  end

end