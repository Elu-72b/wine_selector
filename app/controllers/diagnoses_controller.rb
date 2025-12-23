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
        { id: 'full', label: 'フルボディ', result: 'シラー', description: '香り豊かで、果実の味が強い赤ワイン。', result2: 'カベルネ・ソーヴィニヨン', description2: '力強く、タンニンが豊かな赤ワイン。' },
        { id: 'light', label: 'ライト', result: 'ピノ・ノワール', description: '軽く爽やかで、酸味が豊かな赤ワイン。', result2: 'ガメイ', description2: 'フルーティーで飲みやすい赤ワイン。' }
      ]
    },
    3 => {
      text: '好きな味わいは？',
      choices: [
        { id: 'dry', label: '辛口', result: 'ソーヴィニヨン・ブラン', description: '酸味が豊かで、爽やかな白ワイン。', result2: 'リースリング', description2: '軽く爽やかで、香り豊かな白ワイン。' },
        { id: 'sweet', label: '甘口', result: 'ゲヴュルツトラミネール', description: '甘さと香りが特徴的な白ワイン。', result2: 'ヴィオニエ', description2: 'フルーティーで芳醇な香りの白ワイン。' }
      ]
    },
    4 => {
      text: 'どんなシーンで楽しみたいですか？',
      choices: [
        { id: 'cheers', label: '乾杯に', result: 'プロセッコ', description: '軽く爽やかで、香り豊かなスパークリングワイン。', result2: 'フランチャコルタ', description2: '香り豊かで、甘さと酸味がバランスの取れたスパークリングワイン。' },
        { id: 'dessert', label: 'デザートに', result: 'モスカート・ダスティ', description: '甘さと香りが特徴的なスパークリングワイン。', result2: 'アスティ', description2: '軽く爽やかで、香り豊かなスパークリングワイン。' }
      ]
    }

  }.freeze

  def start
    session[:result] = nil
    session[:result2] = nil
    session[:description] = nil
    session[:description2] = nil

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

    question = QUESTIONS[step]
    choice = question[:choices].find { |c| c[:id] == choice_id }

    if choice[:result]
      session[:result] = choice[:result]
      session[:description] = choice[:description]
      session[:result2] = choice[:result2]
      session[:description2] = choice[:description2]
      redirect_to diagnoses_result_path
    else
      redirect_to diagnoses_question_path(step: choice[:next_step])
    end
  end

  def result
  redirect_to root_path and return unless session[:result]

  @result = session[:result]
  @description = session[:description]
  @result2 = session[:result2]
  @description2 = session[:description2]
  end

end
