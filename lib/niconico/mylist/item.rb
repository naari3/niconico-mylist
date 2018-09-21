# frozen_string_literal: true

require 'niconico/mylist/xpathable'

require 'time'

class Niconico::Mylist::Item
  include Niconico::Mylist::Xpathable

  def initialize(data)
    @data = data
  end

  def title
    @title ||= xpath_text('title')
  end

  def link
    @link ||= xpath_text('link')
  end

  def guid
    @guid ||= xpath_text('guid')
  end

  def pub_date
    @pub_date ||= Time.parse(xpath_text('pubDate'))
  end

  def description
    @description ||= xpath_text('description')
  end

  def inspect
    "#<#{self.class.name} title: #{title}>"
  end
end
