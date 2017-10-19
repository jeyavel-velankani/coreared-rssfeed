namespace :sync do
  task feeds: [:environment] do
    #puts Feed.all.inspect
    Feed.all.each do |feed|
      content = Feedjira::Feed.fetch_and_parse feed.url
      #puts content.inspect
      content.entries.each do |entry|
        #puts entry.title.inspect
        #puts "this is feedkeyword"
       # puts feed.keyword.inspec
       puts"this is the rake task"
          keywords=feed.keyword.split(',')
              keywords.each do |k|  
                  if entry.title.downcase.include?k.downcase

                    local_entry = feed.entries.where(title: entry.title).first_or_initialize
                    local_entry.update_attributes(content: entry.content, author: entry.author, url: entry.url, published: entry.published)
                    p "Synced Entry - #{entry.title}"
        
                  else
                    next
                  end
              end    
    end
      p "Synced Feed - #{feed.name}"
    end
  end
end