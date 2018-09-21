# frozen_string_literal: true

require 'faraday'
require 'faraday-encoding'
require 'rexml/document'

class Niconico::Mylist::Client
  def find_xml(id)
    response = faraday.get("/mylist/#{id}?rss=2.0")
    REXML::Document.new(response.body).root
  end

  private

  def faraday
    @faraday ||= Faraday.new(url: Niconico::Mylist.config.endpoint) do |faraday|
      faraday.response :encoding
      faraday.adapter Faraday.default_adapter
    end
  end
end
