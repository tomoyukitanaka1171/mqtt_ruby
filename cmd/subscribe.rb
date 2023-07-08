require 'mqtt'
require 'logger'

class MqttSubscriber
  URI = 'test.mosquitto.org'
  SUBSCRIBE_CHANNEL = 'tomoyuki_channel'

  def initialize
      @client = MQTT::Client.connect(URI)
      @logger = Logger.new(STDOUT)
      @logger.formatter = ::Logger::Formatter.new
  end

  def receive
      @logger.info("subscribe channel")
      begin
          @client.get(SUBSCRIBE_CHANNEL) do |topic, message|
            @logger.info("#{topic}: #{message}")
          end
      rescue => e
          @logger.error("error: #{e}")
      end
  end
end

MqttSubscriber.new.receive