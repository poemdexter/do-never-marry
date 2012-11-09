class Reason < ActiveRecord::Base
    attr_accessible :text

    validates_presence_of :text

    def self.random(options = {})
        count = self.count()
        self.find(:first, options.merge(:offset => rand(count)))
    end
end