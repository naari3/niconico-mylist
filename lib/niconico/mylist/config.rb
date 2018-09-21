# frozen_string_literal: true

module Niconico
  class Mylist
    class Config
      attr_writer :endpoint
      def endpoint
        @endpoint ||= Niconico::Mylist::ENDPOINT
      end

      def faraday_configure(&block)
        if block
          @faraday_configure = block
        else
          @faraday_configure ||= proc {}
        end
      end

      attr_writer :faraday_configure
    end
  end
end
