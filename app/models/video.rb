# == Schema Information
#
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
#

class Video < ActiveRecord::Base
  # attr_accessible :link

  #YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([\w]*).*/
  # YT_LINK_FORMAT = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
  YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

  validates :link, presence: true, format: YT_LINK_FORMAT

  # before_create -> do
  #   uid = link.match(YT_LINK_FORMAT)
  #
  #   self.uid = uid[1] if uid && uid[1]
  #
  #   if self.uid.to_s.length != 11
  #     self.errors.add(:link, 'is invalid.')
  #     false
  #   elsif Video.where(uid: self.uid).any?
  #     self.errors.add(:link, 'is not unique.')
  #     false
  #   else
  #     get_additional_info
  #   end
  # end
  #
  #
  # private
  #
  # def get_additional_info
  #   begin
  #     video = yt_video
  #     # video = YTClient.getVideo(uid)
  #     self.title = video.title
  #     self.description = video.description
  #     self.tags = video.tags
  #     self.duration = parse_duration(video.duration)
  #     self.author = video.author.name
  #     self.likes = video.rating.likes
  #     self.dislikes = video.rating.dislikes
  #   rescue
  #     self.title = '' ; self.duration = '00:00:00' ; self.author = '' ; self.likes = 0 ; self.dislikes = 0
  #   end
  # end
  #
  # def parse_duration(d)
  #   hr = (d / 3600).floor
  #   min = ((d - (hr * 3600)) / 60).floor
  #   sec = (d - (hr * 3600) - (min * 60)).floor
  #
  #   hr = '0' + hr.to_s if hr.to_i < 10
  #   min = '0' + min.to_s if min.to_i < 10
  #   sec = '0' + sec.to_s if sec.to_i < 10
  #
  #   hr.to_s + ':' + min.to_s + ':' + sec.to_s
  # end
  #
  # def yt_video
  #   Yt.configuration.api_key = "AIzaSyDlApe_mfjJOEvsA0Y3VAb-mL1L-CQcjBE"
  #   Yt::Video.new id: self.uid
  # end

end