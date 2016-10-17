ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }


  content title: proc{ I18n.t("active_admin.dashboard") } do
      contracts = Contract.contracts_by_beneficiars()
      json_data = []
      json_categories = []
      contracts.each do |data|
        json_data << {
          name: data.name,
          y: data.value
        }

        json_categories << data.name
      end
    
      render partial: 'chart_top_columns', locals: {
        contracts: json_data.to_json,
        categories: json_categories.to_json,
        crt: 1,
        title: 'Top 10 beneficiari'
      }

      contracts = Contract.contracts_by_contractors()
      json_data = []
      json_categories = []
      contracts.each do |data|
        json_data << {
          name: data.contractor_name,
          y: data.value
        }

        json_categories << data.contractor_name
      end
    
      render partial: 'chart_top_columns', locals: {
        contracts: json_data.to_json,
        categories: json_categories.to_json,
        crt: 2,
        title: 'Top 10 furnizori'
      }

    end
end
