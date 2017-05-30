# Table name: videos
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  link       :string(255)
#  uid        :string(255)
#  author     :string(255)
#  duration   :string(255)
#  likes      :integer
#  dislikes   :integer

ActiveRecord::Schema.define(:version => 20140313185227) do

  create_table 'videos', :force => true do |t|
    t.string   'uid'
    t.string   'title'
    t.string   'link'
    t.string   'duration'
    t.datetime 'published_at'
    t.integer  'likes'
    t.integer  'dislikes'
    t.string   'author'
    t.datetime 'created_at', :null => false
    t.datetime 'updated_at', :null => false
  end

  add_index "videos", ['uid'], :name => "index_videos_on_uid", :unique => true

end