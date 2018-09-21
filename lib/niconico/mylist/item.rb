# frozen_string_literal: true

require 'niconico/mylist/xpathable'

class Niconico::Mylist::Item
  include Niconico::Mylist::Xpathable

  def initialize(data)
    @data = data
  end

  def title
    xpath_text('title')
  end

  def link
    xpath_text('link')
  end

  def guid
    xpath_text('guid')
  end

  def pub_date
    xpath_text('pub_date')
  end

  def description
    xpath_text('description')
  end
end
