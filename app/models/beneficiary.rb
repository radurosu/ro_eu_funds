class Beneficiary < ActiveRecord::Base
    has_many :contracts
end
