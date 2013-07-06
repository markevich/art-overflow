module MailerWorld
  def absolute_to_relative(url)
    url.gsub(/https?:\/\/(\w+\.?)+/, '')
  end
end
World(MailerWorld)
