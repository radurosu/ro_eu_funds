ActiveAdmin.register Beneficiary do
  remove_filter :contracts
  # sidebar "Project Details", only: [:show, :edit] do
  #   ul do
  #     li link_to "Contracts", admin_beneficiary_contracts_path(beneficiary)
  #   end
  # end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
