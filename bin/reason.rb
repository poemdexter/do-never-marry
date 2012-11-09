class Reason < ActiveRecord::Base
    attr_accessible :text

    validates_presence_of :text

    def self.random(options = {})
        count = self.count()
        result = self.find(:first, options.merge(:offset => rand(count)))
        if result.nil?
            reason = Reason.new
            reason.text = ""
            return reason
        else
            result
        end
    end
end