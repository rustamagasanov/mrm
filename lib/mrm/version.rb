module MRM
  class Version
    MAJOR = 1
    MINOR = 2
    PATCH = 0
    PRE = nil

    class << self
      def to_s
        [MAJOR, MINOR, PATCH, PRE].compact.join('.')
      end
    end
  end
end
