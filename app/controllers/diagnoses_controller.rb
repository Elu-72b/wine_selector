class DiagnosesController < ApplicationController
  QUESTIONS = {
    1 => {
      text: '何に合わせたい？',
      choices: [
        { id: 'food', label: 'お料理に', next_step: 2 },
        { id: 'sweets', label: 'スイーツに', next_step: 3 },
        { id: 'snacks', label: 'おつまみに', next_step: 4 },
        { id: 'just_wine', label: 'ワインだけで', next_step: 5 }
      ]
    },
    2 => {
      text: 'どんなお料理に合わせる？',
      choices: [
        { id: 'fish', label: '魚料理', next_step: 6 },
        { id: 'meat', label: '肉料理', next_step: 7 },
        { id: 'vegetables', label: '野菜料理', next_step: 8 }
      ]
    },
    3 => {
      text: 'どんなスイーツに合わせる？',
      choices: [
        { id: 'chocolate', label: 'チョコレート', next_step: 9 },
        { id: 'fruit', label: '果物', next_step: 10 }
      ]
    },
    4 => {
      text: 'どんなおつまみに合わせる？',
      choices: [
        { id: 'nuts', label: 'ナッツ類', next_step: 11 },
        { id: 'cheese', label: 'チーズ類', next_step: 12 }
      ]
    },
    5 => {
      text: '渋みについてどう思いますか？',
      choices: [
        { id: 'light', label: '軽めの渋み', next_step: 13 },
        { id: 'medium', label: '中程度の渋み', next_step: 14 },
        { id: 'strong', label: '強い渋み', next_step: 15 }
      ]
    },
    6 => {
        text: 'どんな魚料理に合わせる？',
        choices: [
          { id: 'sushi', label: '寿司', result: 'ソーヴィニヨン・ブラン', pairing: '寿司、刺身、シーフードサラダ',
            description: 'さっぱりとした味わいが特徴の白ワインがおすすめです。',
            another_result:'辛口さっぱりめのシャルドネ' },
          { id: 'grilled_fish', label: 'ムニエル、グリル', result: 'シャルドネ', pairing: 'グリルドフィッシュ、ローストチキン、クリームソースパスタ',
            description: 'バターやクリームソースには樽熟成の白ワインがおすすめです。',
            another_result:'ソーヴィニヨン・ブラン' }
        ]
    },
    7 => {
        text: 'どんな肉料理に合わせる？',
        choices: [
          { id: 'red_meat', label: 'ビーフやラムなど', result: 'カベルネ・ソーヴィニヨン', pairing: 'ステーキ、ローストビーフ、バーベキュー',
            description: 'しっかりとした味わいの赤ワインがおすすめです。',
            another_result:'シラー' },
          { id: 'white_meat', label: 'チキンやポークなど', result: 'ピノ・ノワール', pairing: '鶏肉のグリル、ポークソテー、ターキー',
            description: '軽やかな味わいの赤ワインがおすすめです。',
            another_result:'メルロー' }
        ]
    },
    8 => {
        text: 'どんな野菜料理に合わせる？',
        choices: [
          { id: 'salad', label: 'サラダ', result: 'リースリング', pairing: 'グリーンサラダ、シーザーサラダ、野菜スティック',
            description: 'フレッシュでフルーティーな白ワインがおすすめです。',
            another_result:'ソーヴィニヨン・ブラン' },
          { id: 'roasted_vegetables', label: 'ロースト野菜', result: 'ゲヴュルツトラミネール', pairing: 'ローストベジタブル、スパイシー料理、アジア料理',
            description: 'スパイシーな料理にはアロマティックな白ワインがおすすめです。',
            another_result:'シャルドネ' }
        ]
    },
    9 => {
        text: 'どんなチョコレートスイーツに合わせる？',
        choices: [
          { id: 'dark_chocolate', label: 'ダークチョコレート', result: 'ポートワイン', pairing: 'ダークチョコレート、チョコレートケーキ、ブラウニー',
            description: '濃厚な甘みのデザートワインがおすすめです。',
            another_result:'シラー' },
          { id: 'milk_chocolate', label: 'ミルクチョコレート', result: 'マルベック', pairing: 'ミルクチョコレート、チョコレートムース、チョコレートフォンデュ',
            description: 'フルーティーで柔らかな赤ワインがおすすめです。',
            another_result:'メルロー' }
        ]
    },
    10 => {
        text: 'どんな果物スイーツに合わせる？',
        choices: [
          { id: 'berry_dessert', label: 'ベリー系デザート', result: 'モスカート・ダスティ', pairing: 'ベリータルト、フルーツサラダ、パンナコッタ',
            description: '甘酸っぱいデザートには甘口のスパークリングワインがおすすめです。',
            another_result:'リースリング' },
          { id: 'citrus_dessert', label: '柑橘系デザート', result: 'ヴィオニエ', pairing: 'レモンタルト、オレンジケーキ、シトラスサラダ',
            description: 'フルーティーで芳醇な白ワインがおすすめです。',
            another_result:'ゲヴュルツトラミネール' }
        ]
    },
    11 => {
        text: 'どんなナッツ類に合わせる？',
        choices: [
          { id: 'almonds', label: 'アーモンド', result: 'シェリー', pairing: 'アーモンド、ヘーゼルナッツ、カシューナッツ',
            description: 'ナッツの風味を引き立てるフォーティファイドワインがおすすめです。',
            another_result:'ヴィオニエ' },
          { id: 'mixed_nuts', label: 'ミックスナッツ', result: 'シャルドネ', pairing: 'ミックスナッツ、ピスタチオ、マカダミアナッツ',
            description: 'クリーミーな味わいの白ワインがおすすめです。',
            another_result:'リースリング' }
        ]
    },
    12 => {
        text: 'どんなチーズ類に合わせる？',
        choices: [
          { id: 'hard_cheese', label: 'ハードチーズ', result: 'カベルネ・ソーヴィニヨン', pairing: 'チェダー、パルミジャーノ、グラナパダーノ',
            description: 'しっかりとした味わいの赤ワインがおすすめです。',
            another_result:'シラー' },
          { id: 'soft_cheese', label: 'ソフトチーズ', result: 'ピノ・ノワール', pairing: 'ブリー、カマンベール、フレッシュチーズ',
            description: '軽やかな味わいの赤ワインがおすすめです。',
            another_result:'メルロー' }
        ]
    },
    13 => {
        text: 'どんな軽めの渋みが好き？',
        choices: [
          { id: 'fruity', label: 'フルーティー', result: 'ピノ・ノワール', pairing: '鶏肉、豚肉、軽めのパスタ',
            description: '軽やかでフルーティーな赤ワインがおすすめです。',
            another_result:'メルロー' },
          { id: 'earthy', label: 'アーシー', result: 'グルナッシュ', pairing: 'グリル野菜、ラムチョップ、トマトソースパスタ',
            description: '土っぽい風味の赤ワインがおすすめです。',
            another_result:'シラー' }
        ]
    },
    14 => {
        text: 'どんな中程度の渋みが好き？',
        choices: [
          { id: 'balanced', label: 'バランスの取れた味わい', result: 'メルロー', pairing: 'ローストビーフ、ミートソースパスタ、チーズ',
            description: 'バランスの取れた味わいの赤ワインがおすすめです。',
            another_result:'ピノ・ノワール' },
          { id: 'spicy', label: 'スパイシー', result: 'シラー', pairing: 'バーベキュー、スパイシーカレー、グリルドラム',
            description: 'スパイシーな風味の赤ワインがおすすめです。',
            another_result:'グルナッシュ' }
        ]
    },
    15 => {
        text: 'どんな強い渋みが好き？',
        choices: [
          { id: 'full_body', label: 'フルボディ', result: 'カベルネ・ソーヴィニヨン', pairing: 'ステーキ、ローストラム、濃厚なシチュー',
            description: '力強い味わいの赤ワインがおすすめです。',
            another_result:'マルベック' },
          { id: 'tannic', label: 'タンニン豊富', result: 'マルベック', pairing: 'グリルドビーフ、スパイシー料理、熟成チーズ',
            description: 'タンニン豊富な赤ワインがおすすめです。',
            another_result:'カベルネ・ソーヴィニヨン' }
        ]
    }
  }.freeze

  def start
    session[:result] = nil
    session[:description] = nil
    session[:another_result] = nil
    session[:pairing] = nil
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
      session[:another_result] = choice[:another_result]
      session[:pairing] = choice[:pairing]
      redirect_to diagnoses_result_path
    else
      redirect_to diagnoses_question_path(step: choice[:next_step])
    end
  end

  def result
  redirect_to root_path and return unless session[:result]

  @result = session[:result]
  @description = session[:description]
  @another_result = session[:another_result]
  @pairing = session[:pairing]
  end

end
