# frozen_string_literal: true

RSpec.describe Niconico::Mylist do
  describe '#find' do
    subject { Niconico::Mylist.find(id) }

    before do
      WebMock.enable!
      stub_request(:get, 'http://www.nicovideo.jp/mylist/111?rss=2.0')
        .to_return(status: http_status, body: <<~XML)
          <?xml version="1.0" encoding="utf-8"?>
          <rss version="2.0"
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:atom="http://www.w3.org/2005/Atom">
            <channel>
              <title>マイリスト title‐ニコニコ動画</title>
              <link>http://www.nicovideo.jp/mylist/#{id}</link>
              <atom:link rel="self" type="application/rss+xml" href="http://www.nicovideo.jp/mylist/#{id}?rss=2.0"/>
              <description>description</description>
              <pubDate>Wed, 01 Mar 2017 09:10:34 +0900</pubDate>
              <lastBuildDate>Wed, 01 Mar 2017 09:10:34 +0900</lastBuildDate>
              <generator>ニコニコ動画</generator>
              <dc:creator>creator</dc:creator>
              <language>ja-jp</language>
              <copyright>(c) DWANGO Co., Ltd.</copyright>
              <docs>http://blogs.law.harvard.edu/tech/rss</docs>
              #{items_xml.join("\n")}
            </channel>
          </rss>
        XML
    end

    let(:id) { 111 }
    let(:items_xml) do
      Array.new(5) { |i| <<~XML }
        <item>
          <title>title#{i}</title>
          <link>link</link>
          <guid isPermaLink="false">guid</guid>
          <pubDate>Mon, 01 Jan 2018 05:25:41 +0900</pubDate>
          <description><![CDATA[<a>description</a>]]></description>
        </item>
      XML
    end
    let(:items) { items_xml.map { |xml| Niconico::Mylist::Item.new(REXML::Document.new(xml).root) } }

    context '200 OK' do
      let(:http_status) { 200 }

      it 'does assignment' do
        expect(subject.title).to eq('title')
        expect(subject.link).to eq("http://www.nicovideo.jp/mylist/#{id}")
        expect(subject.description).to eq('description')
        expect(subject.pub_date).to eq(Time.parse('Wed, 01 Mar 2017 09:10:34 +0900'))
        expect(subject.last_build_date).to eq(Time.parse('Wed, 01 Mar 2017 09:10:34 +0900'))
        expect(subject.creator).to eq('creator')
        subject.items.zip(items).each do |a, b|
          expect(a.title).to match(b.title)
        end
      end
    end

    context '404 Not Found' do
      let(:http_status) { 404 }

      it { expect { subject }.to raise_error Niconico::Mylist::Error::NotFoundError }
    end
  end
end
