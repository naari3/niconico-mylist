# frozen_string_literal: true

require 'rexml/document'

RSpec.describe Niconico::Mylist::Item do
  subject { Niconico::Mylist::Item.new(item) }

  let(:item) do
    REXML::Document.new(<<~XML).root
      <item>
        <title>title</title>
        <link>link</link>
        <guid isPermaLink="false">guid</guid>
        <pubDate>Mon, 01 Jan 2018 05:25:41 +0900</pubDate>
        <description><![CDATA[<a>description</a>]]></description>
      </item>
    XML
  end

  it 'does assignment' do
    expect(subject.title).to eq('title')
    expect(subject.link).to eq('link')
    expect(subject.guid).to eq('guid')
    expect(subject.pub_date).to eq(Time.parse('Mon, 01 Jan 2018 05:25:41 +0900'))
    expect(subject.description).to eq('<a>description</a>')
  end
end
