#encoding: UTF-8

xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title Settings.blog.title
    xml.description Settings.blog.subtitle
    xml.link Settings.blog.url
    
    for article in @articles
      xml.item do
        xml.title article.title
        xml.description article.text
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link Settings.blog.url + "/articles/" + article.id.to_s
        xml.guid Settings.blog.url + "/articles/" + article.id.to_s
      end
    end
  end
end
