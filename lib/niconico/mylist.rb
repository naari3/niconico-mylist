# frozen_string_literal: true

require 'niconico/mylist/config'
require 'niconico/mylist/client'
require 'niconico/mylist/item'
require 'niconico/mylist/xpathable'

require 'niconico/mylist/version'

require 'time'

class Niconico::Mylist
  include Xpathable

  ENDPOINT = 'http://www.nicovideo.jp'

  class << self
    def config
      @config ||= Niconico::Mylist::Config.new
    end

    def configure
      yield(config) if block_given?
    end

    def find(id)
      new(client.find_xml(id))
    end

    private

    def client
      Thread.current[:mylist_client] ||= begin
        client = Niconico::Mylist::Client.new
        config.faraday_configure.call(client)
        client
      end
    end
  end

  def initialize(data)
    @data = data
  end

  def title
    xpath_text('channel/title')
  end

  def link
    xpath_text('channel/link')
  end

  def description
    xpath_text('channel/description')
  end

  def pub_date
    Time.parse(xpath_text('channel/description'))
  end

  def last_build_date
    Time.parse(xpath_text('channel/description'))
  end

  def creator
    xpath_text('channel/dc:creator')
  end

  def items
    xpath_match('channel/item').map {|item| Niconico::Mylist::Item.new(item) }
  end
end
