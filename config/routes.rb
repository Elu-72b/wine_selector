Rails.application.routes.draw do
  root 'static_pages#top'

  get 'diagnoses/start', to: 'diagnoses#start'
  get 'diagnoses/question/:step', to: 'diagnoses#question', as: 'diagnoses_question'
  post 'diagnoses/answer/:step', to: 'diagnoses#answer', as: 'diagnoses_answer'
  get 'diagnoses/result', to: 'diagnoses#result'
end
