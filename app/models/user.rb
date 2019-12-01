class User < ApplicationRecord
    def is_deletable?
        is_admin == false
    end
end
