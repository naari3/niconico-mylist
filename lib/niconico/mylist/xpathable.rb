# frozen_string_literal: true

require 'rexml/document'

module Niconico::Mylist::Xpathable
  private

  def xpath_text(path)
    REXML::XPath.first(@data, path).text
  end

  def xpath_match(path)
    REXML::XPath.match(@data, path)
  end
end
