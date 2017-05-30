class VideoObserver < ActiveRecord::Observer

  YT_LINK_FORMAT2 = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

  def before_save(resource)
    uid = resource.link.match(YT_LINK_FORMAT2)

    vid = uid[2].to_s

    if vid.to_s.length != 11
          errors.add(:link, 'is invalid.')
          false
    elsif Video.where(uid: vid).any?
          # errors.add(:link, 'is not unique.')
          false
    end

    video = Yt::Video.new id: vid
    resource.uid = video.id
    resource.title = video.title
    resource.likes = video.like_count
    resource.dislikes = video.dislike_count
    resource.duration = video.duration
    # resource.published_at = video.published_at
  rescue Yt::Errors::NoItems
    resource.title = ''
  end
end