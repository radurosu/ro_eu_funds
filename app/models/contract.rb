class Contract < ActiveRecord::Base
    belongs_to :beneficiary, :class_name => "Beneficiary", :foreign_key => "beneficiary_id", :counter_cache => true

    def self.contracts_by_beneficiars
        Contract.select('sum(contracts.contr_value) as value, beneficiaries.name')
            .joins(:beneficiary)
            .group("beneficiaries.id")
            .order("sum(contracts.contr_value) desc")
            .limit("10")
    end 

    def self.contracts_by_contractors
        Contract.select('sum(contracts.contr_value) as value, contractor_name')
            .group("contractor_name")
            .order("sum(contracts.contr_value) desc")
            .limit("10")
    end
    
end
