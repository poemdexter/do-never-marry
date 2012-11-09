class Reason < ActiveRecord::Base
    attr_accessible :text

    validates_presence_of :text

    def self.random(options = {})
        count = self.count()
        result = self.find(:first, options.merge(:offset => rand(count)))
        if result.nil?
            dummy()
        else
            result
        end
    end

    def dummy
        reason = Reason.new
        reason.text = "It's a bad idea."
        return reason
    end
end