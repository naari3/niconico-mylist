# frozen_string_literal: true

require 'niconico/mylist/config'
require 'niconico/mylist/client'
require 'niconico/mylist/item'

require 'niconico/mylist/version'

require 'time'

class Niconico::Mylist
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
    xpath_text('title')
  end

  def link
    xpath_text('link')
  end

  def description
    xpath_text('description')
  end

  def pub_date
    Time.parse(xpath_text('description'))
  end

  def last_build_date
    Time.parse(xpath_text('description'))
  end

  def creator
    xpath_text('dc:creator')
  end

  def items
    xpath_match('item').map {|item| Niconico::Mylist::Item.new(item) }
  end

  private

  def xpath_text(path)
    REXML::XPath.first(@data, "channel/#{path}").text
  end

  def xpath_match(path)
    REXML::XPath.match(@data, "channel/#{path}")
  end
end
