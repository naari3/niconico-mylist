# frozen_string_literal: true

require 'faraday'
require 'faraday-encoding'
require 'rexml/document'

class Niconico::Mylist::Client
  def find_xml(id)
    response = faraday.get("/mylist/#{id}?rss=2.0")
    REXML::Document.new(response.body).root
  rescue Faraday::Error::ResourceNotFound
    raise Niconico::Mylist::Error::NotFoundError, id
  rescue Faraday::Error::ClientError => e
    raise Niconico::Mylist::Error::ForbiddenError, id if e.response.status == 403
    raise e
  end

  private

  def faraday
    @faraday ||= Faraday.new(url: Niconico::Mylist.config.endpoint) do |faraday|
      faraday.response :encoding
      faraday.response :raise_error
      faraday.adapter Faraday.default_adapter
    end
  end
end
