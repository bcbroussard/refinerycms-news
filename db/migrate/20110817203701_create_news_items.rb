class CreateNewsItems < ActiveRecord::Migration

  def up
    create_table ::Refinery::News::Item.table_name do |t|
      t.string :title
      t.text :body
      t.datetime :publish_date

      t.timestamps
    end

    add_index ::Refinery::News::Item.table_name, :id
  end

  def down
    ::Refinery::UserPlugin.destroy_all :name => "refinerycms_news"

    ::Refinery::Page.delete_all :link_url => Refinery::News.page_url

    drop_table ::Refinery::News::Item.table_name
  end

end
