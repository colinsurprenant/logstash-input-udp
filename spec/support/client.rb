# encoding: utf-8
require "socket"

module LogStash::Inputs::Test

  class UDPClient

    attr_reader :host, :port, :socket

    def initialize(port, host="0.0.0.0")
      @port = port
      @host = host
      @socket = UDPSocket.new(Socket::AF_INET6)
    end

    def send(msg="")
      begin
        send(msg)
      rescue Exception => e
        puts "send.exception", e
        retry
      end
    end

    def send(msg)
      socket.send(msg, 0, host, port)
    end

    def close
      socket.close
    end

  end

end
