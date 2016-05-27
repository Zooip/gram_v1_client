class GramV1Client
  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end


    def configure
      yield(configuration)
    end
  end

  class Configuration
    attr_accessor :site,
                  :user,
                  :password,
                  :proxy

    def initialize
      @site      = nil
      @user      = nil
      @password  = nil
      @proxy     = nil
    end
  end
end