# frozen_string_literal: true

module Niconico
  class Mylist
    class Error < StandardError
      class NotFoundError < StandardError
        def initialize(id)
          @id = id
          super("Couldn't find Niconico Mylist with 'id'=#{@id}")
        end
      end

      class ForbiddenError < StandardError
        def initialize(id)
          @id = id
          super("Niconico Mylist with 'id'=#{@id} is forbidden")
        end
      end
    end
  end
end
