module ActiveRecord
  class Base
    def self.escape_like(string)
      string.gsub(/[\\%_]/){|_| "\\#{_}"}
    end
  end
end
