module YTClient
  require 'yt'

  API_KEY = 'AIzaSyDlApe_mfjJOEvsA0Y3VAb-mL1L-CQcjBE'

  def self.getChannelVideos(id)
    Yt.configuration.api_key = API_KEY
    channel = Yt::Channel.new id: id
    channel.videos.take(5)
  end

  def self.getUserSubscriptions(user)
    account = Yt::Account.new access_token: user.oauth_token
    account.subscribed_channels
  end

  def self.getVideo(id)
    Yt.configuration.api_key = API_KEY
    Yt.configure do |config| config.log_level = :debug end
    video = Yt::Video.new id: id
    return video.snippet
  end

end