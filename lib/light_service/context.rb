module LightService
  module Outcomes
    SUCCESS = 0
    FAILURE = 1
  end

  class Context
    attr_accessor :outcome, :message_key

    def initialize(outcome=::LightService::Outcomes::SUCCESS, message_key='', context={})
      @outcome, @message_key, @context = outcome, message_key, context
    end

    def self.make(context={})
      Context.new(::LightService::Outcomes::SUCCESS, '', context)
    end

    def add_to_context(values)
      @context.merge! values
    end

    def [](index)
      @context[index]
    end

    def []=(index, value)
      @context[index] = value
    end

    def fetch(index)
      @context.fetch(index)
    end

    # It's really there for testing and debugging
    def context_hash
      @context.dup
    end

    def success?
      @outcome == ::LightService::Outcomes::SUCCESS
    end

    def failure?
      success? == false
    end

    def set_success!(message_key)
      @message_key = message_key
      @outcome = ::LightService::Outcomes::SUCCESS
    end

    def set_failure!(message_key)
      @message_key = message_key
      @outcome = ::LightService::Outcomes::FAILURE
    end

  end
end
