# frozen_string_literal: true

module Aegis
  class QueryStatus
    QUEUED = :queued
    RUNNING = :running
    FINISHED = :finished
    FAILED = :failed
    CANCELLED = :cancelled

    STATUSES = [QUEUED, RUNNING, FINISHED, FAILED, CANCELLED].freeze

    attr_reader :id, :status, :message, :output_location

    def initialize(id, status, message, output_location)
      raise ArgumentError, "Unsupported status #{status}" unless STATUSES.include?(status)

      @id = id
      @status = status
      @message = message
      @output_location = output_location
    end

    def finished?
      status == FINISHED
    end

    def failed?
      status == FAILED
    end

    def queued?
      status == QUEUED
    end

    def running?
      status == RUNNING
    end

    def in_progress?
      [RUNNING, QUEUED].include?(status)
    end
  end
end