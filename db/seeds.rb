if defined?(::Refinery::User)
  ::Refinery::User.all.each do |user|
    if user.plugins.where(:name => 'refinerycms_news').blank?
      user.plugins.create(:name => 'refinerycms_news')
    end
  end
end

if defined?(::Refinery::Page)
  unless ::Refinery::Page.where(:menu_match => "^/news.*$").any?
    page = ::Refinery::Page.create(
      :title => Refinery::News.page_title,
      :link_url => Refinery::News.page_url,
      :deletable => false,
      :menu_match => "^/news.*$"
    )

    ::Refinery::Pages.default_parts.each do |default_page_part|
      page.parts.create(:title => default_page_part, :body => nil)
    end
  end
end
