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
      text: 'どのワインの気分？',
      choices: [
        { id: 'light', label: '白ワイン', next_step: 13 },
        { id: 'medium', label: '赤ワイン', next_step: 14 },
        { id: 'strong', label: 'スパークリングワイン', next_step: 15 }
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
        text: 'どんなチョコレートに合わせる？',
        choices: [
          { id: 'dark_chocolate', label: 'ビターチョコレート', result: 'ポートワイン', pairing: 'ダークチョコレート、熟成チーズ、ナッツ',
            description: '濃厚な味わいの赤ワインがおすすめです。',
            another_result:'カベルネ・ソーヴィニヨン' },
          { id: 'milk_chocolate', label: 'ミルクチョコレート', result: 'メルロー', pairing: 'ミルクチョコレート、ベリー系デザート、ナッツ',
            description: '柔らかな味わいの赤ワインがおすすめです。',
            another_result:'ピノ・ノワール' }
        ]
    },
    10 => {
        text: 'どんな果物に合わせる？',
        choices: [
          { id: 'berry_dessert', label: 'ベリー系', result: 'モスカート・ダスティ', pairing: 'ベリータルト、フルーツサラダ、パンナコッタ',
            description: '甘酸っぱいデザートには甘口のスパークリングワインがおすすめです.',
            another_result:'リースリング' },
          { id: 'citrus_dessert', label: '柑橘系', result: 'ヴィオニエ', pairing: 'レモンタルト、オレンジケーキ、シトラスサラダ',
            description: 'フルーティーで芳醇な白ワインがおすすめです。',
            another_result:'ゲヴュルツトラミネール' }
        ]
    },
    11 => {
        text: 'どんなナッツ類に合わせる？',
        choices: [
          { id: 'almonds', label: 'アーモンド', result: 'フランスのシャンパーニュ', pairing: 'アーモンド、カシューナッツ、軽いチーズ',
            description: 'ナッツの風味を引き立てるスパークリングワインがおすすめです。',
            another_result:'イタリアのプロセッコ' },
          { id: 'walnuts', label: 'くるみ', result: '樽熟成のシャルドネ', pairing: 'くるみ、ブルーチーズ、ドライフルーツ',
            description: 'くるみのコクには深みのある白ワインがおすすめです。',
            another_result:'ヴィオニエ' }
        ]
    },
    12 => {
        text: 'どんなチーズ類に合わせる？',
        choices: [
          { id: 'soft_cheese', label: 'カマンベール、ブリーなどのソフトチーズ', result: 'シャルドネ', pairing: 'カマンベール、ブリー、クリームチーズ',
            description: 'クリーミーなチーズには樽熟成の白ワインがおすすめです。',
            another_result:'ソーヴィニヨン・ブラン' },
          { id: 'hard_cheese', label: 'チェダー、パルミジャーノなどのハードチーズ', result: 'カベルネ・ソーヴィニヨン', pairing: 'チェダー、パルミジャーノ、グラナ・パダーノ',
            description: 'しっかりとした味わいの赤ワインがおすすめです。',
            another_result:'シラー' }
        ]
    },
    13 => {
        text: 'どんな白ワインが好き？',
        choices: [
          { id: 'fruity', label: 'さっぱりフルーティー', result: 'ニュージーランド産のソーヴィニヨン・ブラン', pairing: 'シーフード、サラダ、寿司',
            description: 'ハーブや柑橘系、青りんごの香りが豊かな白ワインです。',
            another_result:'スペインのアルバリーニョ' },
          { id: 'light_sweet', label: 'すっきり甘口', result: 'ドイツのリースリング', pairing: 'アジア料理、フルーツ',
            description: '白桃、青りんごのフルーティーな甘さと程よい酸で飲み疲れない白ワインです。',
            another_result:'イタリアのモスカート' },
          { id: 'rich_sweet', label: 'デザート感覚で飲める甘口', result: 'ドイツのアイスワイン', pairing: 'デザート、チーズ、フルーツ',
            description: '濃厚な甘味が特徴の白ワインです。',
            another_result:'ドイツのトロッケン・ベーレン・アウスレーゼ' }
        ]
    },
    14 => {
        text: 'どんな赤ワインが好き？',
        choices: [
          { id: 'light_red', label: '飲み疲れない軽さ', result: 'ピノ・ノワール', pairing: '鶏肉料理、豚肉料理、マイルドなチーズ',
            description: 'チェリーやラズベリーのフルーティーな香りと柔らかなタンニンが特徴の赤ワインです。',
            another_result:'ピノ・ノワール' },
          { id: 'full_body', label: '濃厚な果実味', result: 'イタリア プーリア州のプリミティーボ、アメリカのジンファンデル', pairing: '熟成チーズ、チョコレート、赤身肉料理',
            description: 'ジャムのような濃厚な果実味が特徴の赤ワインです。',
            another_result:'フランス ラングドック・ルーションのフルボディ赤' }
        ]
    },
    15 => {
        text: 'どんなスパークリングワインに惹かれますか？',
        choices: [
          { id: 'fruity', label: 'すっきりしてフルーティな味わい', result: 'イタリアのプロセッコ', pairing: 'アペリティフ、軽い前菜、寿司',
            description: '爽やかな酸味とフルーティーな香りが特徴のスパークリングワインです。',
            another_result:'スペインのカヴァ、イタリアのフランチャコルタ' },
          { id: 'yeast', label: 'パンやナッツのような香り', result: 'フランスのシャンパーニュ', pairing: 'お祝いの席、シーフード、クリーミーな料理',
            description: '複雑で深みのある味わいが特徴のスパークリングワインです。',
            another_result:'スペインのカヴァ・レセルバ' },
          { id: 'sweet', label: 'デザート感覚で飲める甘口', result: 'イタリアのアスティ・スプマンテ', pairing: 'デザート、フルーツ、軽いおつまみ',
            description: '甘くてフルーティーな味わいが特徴のスパークリングワインです。',
            another_result:'イタリアのモスカート・ダスティ' }
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
