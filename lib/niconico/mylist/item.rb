# frozen_string_literal: true

module Niconico
  module Mylist
    # <item>
    #   <title>launchipad(淫夢)</title>
    #   <link>http://www.nicovideo.jp/watch/sm32511068</link>
    #   <guid isPermaLink="false">tag:nicovideo.jp,2017-12-31:/watch/1514711376</guid>
    #   <pubDate>Mon, 01 Jan 2018 05:25:41 +0900</pubDate>
    #   <description><![CDATA[<p class="nico-memo">23. は？</p><p class="nico-thumbnail"><img alt="launchipad(淫夢)" src="https://tn.smilevideo.jp/smile?i=32511068" width="94" height="70" border="0"/></p><p class="nico-description">初挫折です</p><p class="nico-info"><small><strong class="nico-info-length">0:27</strong>｜<strong class="nico-info-date">2017年12月31日 19：00：00</strong> 投稿</small></p>]]></description>
    # </item>
    class Item
      def initialize(data)
        @data = data
      end

      def title
        @title ||= 'title'
      end

      def link
        @link ||= 'link'
      end

      def guid
        @guid ||= 'guid'
      end

      def published_at
        @published_at ||= 'published_at'
      end

      def description
        @description ||= 'description'
      end
    end
  end
end
