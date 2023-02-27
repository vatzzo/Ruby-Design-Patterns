module Services
  class BaseService
    def self.call(...)
      new(...).call
    end

    def call
      raise NotImplementedError
    end
  end
end
