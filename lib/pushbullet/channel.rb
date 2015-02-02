module Pushbullet
  class Channel < Resource
    include Pushable

    def self.subscribe(name)
      create(channel_tag: name)
    end

    def self.unsubscribe(idn)
      Pushbullet.client.delete "#{path}/#{idn}"
      true
    end

    def self.get_info(tag)
      new Pushbullet.client.get("channel-info?tag=#{tag}")
    end

    def self.path
      'subscriptions'
    end
  end
end
