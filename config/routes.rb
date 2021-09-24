Rails.application.routes.draw do
  get 'full_info', to: 'cryptocurrency#full_info'
  get 'specific_info', to: 'cryptocurrency#specific_info'
  get 'convert_cc_to_fiat', to: 'cryptocurrency#convert_cc_to_fiat'
  get 'convert_cc_to_cc', to: 'cryptocurrency#convert_cc_to_cc'
end
