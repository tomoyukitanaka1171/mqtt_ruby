require 'mqtt'
require 'logger'

class MqttClient
    URI = 'test.mosquitto.org'

    def initialize
        @client = MQTT::Client.connect(URI)
        @logger = Logger.new(STDOUT)
        @logger.formatter = ::Logger::Formatter.new
    end

    def receive
        @logger.info("Please enter channel")
        channel = gets.chomp
        @logger.info("Please enter message")
        message = gets.chomp
        begin
            @client.publish(channel, message)
            @logger.info("Succeed: send #{message} to #{channel}")
        rescue => e
            @logger.error("error: #{e}")
        end
    end
end

MqttClient.new.receive
