# frozen_string_literal: true

require 'niconico/mylist/xpathable'

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
    @pub_date ||= xpath_text('pub_date')
  end

  def description
    @description ||= xpath_text('description')
  end
end
