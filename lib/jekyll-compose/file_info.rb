class Jekyll::Compose::FileInfo
  attr_reader :params
  def initialize(params)
    @params = params
  end

  def file_name
    name = Jekyll::Utils.slugify params.title
    "#{name}.#{params.type}"
  end

  def content(addtional_front_matter = {})
    front_matter = YAML.dump({
      'layout' => params.layout,
      'title' => params.title,
    }.merge(addtional_front_matter))

    front_matter + "---\n"
  end
end
