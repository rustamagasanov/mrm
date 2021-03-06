module MRM
  class Version
    MAJOR = 1
    MINOR = 3
    PATCH = 3
    PRE = nil

    class << self
      def to_s
        [MAJOR, MINOR, PATCH, PRE].compact.join('.')
      end
    end
  end
end
