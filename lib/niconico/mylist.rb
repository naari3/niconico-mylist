# frozen_string_literal: true

require 'niconico/mylist/config'
require 'niconico/mylist/client'

require 'niconico/mylist/version'

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
end
