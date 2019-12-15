module SnippetsHelper

  def snippet_tags(novel)
    tags = novel.snippets.map do |snippet|
      snippet.tag
    end
    tags.uniq!
    tags
  end
end
