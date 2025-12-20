class DiagnosesController < ApplicationController
  QUESTIONS = {
    1 => {
      text: '好きなワインのタイプは？',
      choices: [
        { id: 'red', label: '赤', next_step: 2 },
        { id: 'white', label: '白', next_step: 3 },
        { id: 'sparkling', label: 'スパークリング', next_step: 4 }
      ]
    },
    2 => {
      text: '好きな味わいは？',
      choices: [
        { id: 'full', label: 'フルボディ', result: 'カベルネ・ソーヴィニヨン' },
        { id: 'light', label: 'ライト', result: 'ピノ・ノワール' }
      ]
    },
    3 => {
      text: '好きな味わいは？',
      choices: [
        { id: 'dry', label: '辛口', result: 'シャルドネ' },
        { id: 'sweet', label: '甘口', result: 'リースリング' }
      ]
    },
    4 => {
      text: 'どんなシーンで楽しみたいですか？',
      choices: [
        { id: 'cheers', label: '乾杯に', result: 'プロセッコ' },
        { id: 'dessert', label: 'デザートに', result: 'モスカート・ダスティ' }
      ]
    }

  }.freeze

  def start
    session[:answers] = []
    session[:result] = nil
    redirect_to diagnoses_question_path(step: 1)
  end

  def question
    @step = params[:step].to_i
    @question = QUESTIONS[@step]

    redirect_to diagnoses_result_path unless @question
  end

  def answer
    step = params[:step].to_i
    choice_id = params[:choice]

    session[:answers] ||= []
    session[:answers] << choice_id

    question = QUESTIONS[step]
    choice = question[:choices].find { |c| c[:id] == choice_id }

    if choice[:result]
      session[:result] = choice[:result]
      redirect_to diagnoses_result_path
    else
      redirect_to diagnoses_question_path(step: choice[:next_step])
    end
  end

  def result
    @result = session[:result]
    @answers = session[:answers]
  end

end
