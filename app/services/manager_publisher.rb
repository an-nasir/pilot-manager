# frozen_string_literal: true

# /app/services/manager_publisher.rb
#
class ManagerPublisher
  def self.publish(exchange, status)
    x = channel.fanout("manager.#{exchange}")
    x.publish(status.to_json)
  end

  def self.channel
    @channel ||= connection.create_channel
  end

  def self.connection
    @connection ||= Bunny.new.tap(&:start)
  end
end
