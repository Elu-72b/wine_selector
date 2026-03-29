class DiagnosisData
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
          { id: 'sushi', label: '寿司', result: 'ソーヴィニヨン・ブラン', image: 'sushi.jpg', pairing: '寿司、刺身、シーフードサラダ',
            description: 'さっぱりとした味わいが特徴の白ワインがおすすめです。',
            another_result:'辛口さっぱりめのシャルドネ' },
          { id: 'grilled_fish', label: 'ムニエル、グリル', result: 'シャルドネ', image: 'grilled_fish.jpg', pairing: 'グリルドフィッシュ、ローストチキン、クリームソースパスタ',
            description: 'バターやクリームソースには樽熟成の白ワインがおすすめです。',
            another_result:'ソーヴィニヨン・ブラン' }
        ]
    },
    7 => {
        text: 'どんな肉料理に合わせる？',
        choices: [
          { id: 'red_meat', label: 'ビーフやラムなど', result: 'カベルネ・ソーヴィニヨン', image: 'red_meat.jpg', pairing: 'ステーキ、ローストビーフ、バーベキュー',
            description: 'しっかりとした味わいの赤ワインがおすすめです。',
            another_result:'シラー' },
          { id: 'white_meat', label: 'チキンやポークなど', result: 'ピノ・ノワール', image: 'white_meat.jpg', pairing: '鶏肉のグリル、ポークソテー、ターキー',
            description: '軽やかな味わいの赤ワインがおすすめです。',
            another_result:'メルロー' }
        ]
    },
    8 => {
        text: 'どんな野菜料理に合わせる？',
        choices: [
          { id: 'salad', label: 'サラダ', result: 'リースリング', image: 'salad.jpg', pairing: 'グリーンサラダ、シーザーサラダ、野菜スティック',
            description: 'フレッシュでフルーティーな白ワインがおすすめです。',
            another_result:'ソーヴィニヨン・ブラン' },
          { id: 'roasted_vegetables', label: 'ロースト野菜', result: 'ゲヴュルツトラミネール', image: 'roasted_vegetables.jpg', pairing: 'ローストベジタブル、スパイシー料理、アジア料理',
            description: 'スパイシーな料理にはアロマティックな白ワインがおすすめです。',
            another_result:'シャルドネ' }
        ]
    },
    9 => {
        text: 'どんなチョコレートに合わせる？',
        choices: [
          { id: 'dark_chocolate', label: 'ビターチョコレート', result: 'ポートワイン', image: 'dark_chocolate.jpg', pairing: 'ダークチョコレート、熟成チーズ、ナッツ',
            description: '濃厚な味わいの赤ワインがおすすめです。',
            another_result:'カベルネ・ソーヴィニヨン' },
          { id: 'milk_chocolate', label: 'ミルクチョコレート', result: 'メルロー', image: 'milk_chocolate.jpg', pairing: 'ミルクチョコレート、ベリー系デザート、ナッツ',
            description: '柔らかな味わいの赤ワインがおすすめです。',
            another_result:'ピノ・ノワール' }
        ]
    },
    10 => {
        text: 'どんな果物に合わせる？',
        choices: [
          { id: 'berry_dessert', label: 'ベリー系', result: 'モスカート・ダスティ', image: 'berry_dessert.jpg', pairing: 'ベリータルト、フルーツサラダ、パンナコッタ',
            description: '甘酸っぱいデザートには甘口のスパークリングワインがおすすめです.',
            another_result:'リースリング' },
          { id: 'citrus_dessert', label: '柑橘系', result: 'ヴィオニエ', image: 'citrus_dessert.jpg', pairing: 'レモンタルト、オレンジケーキ、シトラスサラダ',
            description: 'フルーティーで芳醇な白ワインがおすすめです。',
            another_result:'ゲヴュルツトラミネール' }
        ]
    },
    11 => {
        text: 'どんなナッツ類に合わせる？',
        choices: [
          { id: 'almonds', label: 'アーモンド', result: 'フランスのシャンパーニュ', image: 'almonds.jpg', pairing: 'アーモンド、カシューナッツ、軽いチーズ',
            description: 'ナッツの風味を引き立てるスパークリングワインがおすすめです。',
            another_result:'イタリアのプロセッコ' },
          { id: 'walnuts', label: 'くるみ', result: '樽熟成のシャルドネ', image: 'walnuts.jpg', pairing: 'くるみ、ブルーチーズ、ドライフルーツ',
            description: 'くるみのコクには深みのある白ワインがおすすめです。',
            another_result:'ヴィオニエ' }
        ]
    },
    12 => {
        text: 'どんなチーズ類に合わせる？',
        choices: [
          { id: 'soft_cheese', label: 'カマンベール、ブリーなどのソフトチーズ', result: 'シャルドネ', image: 'soft_cheese.jpg', pairing: 'カマンベール、ブリー、クリームチーズ',
            description: 'クリーミーなチーズには樽熟成の白ワインがおすすめです。',
            another_result:'ソーヴィニヨン・ブラン' },
          { id: 'hard_cheese', label: 'チェダー、パルミジャーノなどのハードチーズ', result: 'カベルネ・ソーヴィニヨン', image: 'hard_cheese.jpg', pairing: 'チェダー、パルミジャーノ、グラナ・パダーノ',
            description: 'しっかりとした味わいの赤ワインがおすすめです。',
            another_result:'シラー' }
        ]
    },
    13 => {
        text: 'どんな白ワインが好き？',
        choices: [
          { id: 'fruity', label: 'さっぱりフルーティー', result: 'ニュージーランド産のソーヴィニヨン・ブラン', image: 'white_fruity.jpg', pairing: 'シーフード、サラダ、寿司',
            description: 'ハーブや柑橘系、青りんごの香りが豊かな白ワインです。',
            another_result:'スペインのアルバリーニョ' },
          { id: 'light_sweet', label: 'すっきり甘口', result: 'ドイツのリースリング', image: 'white_light_sweet.jpg', pairing: 'アジア料理、フルーツ',
            description: '白桃、青りんごのフルーティーな甘さと程よい酸で飲み疲れない白ワインです。',
            another_result:'イタリアのモスカート' },
          { id: 'rich_sweet', label: 'デザート感覚で飲める甘口', result: 'ドイツのアイスワイン', image: 'white_rich_sweet.jpg', pairing: 'デザート、チーズ、フルーツ',
            description: '濃厚な甘味が特徴の白ワインです。',
            another_result:'ドイツのトロッケン・ベーレン・アウスレーゼ' }
        ]
    },
    14 => {
        text: 'どんな赤ワインが好き？',
        choices: [
          { id: 'light_red', label: '飲み疲れない軽さ', result: 'ピノ・ノワール', image: 'red_light.jpg', pairing: '鶏肉料理、豚肉料理、マイルドなチーズ',
            description: 'チェリーやラズベリーのフルーティーな香りと柔らかなタンニンが特徴の赤ワインです。',
            another_result:'ピノ・ノワール' },
          { id: 'full_body', label: '濃厚な果実味', result: 'イタリア プーリア州のプリミティーボ、アメリカのジンファンデル', image: 'red_full_body.jpg', pairing: '熟成チーズ、チョコレート、赤身肉料理',
            description: 'ジャムのような濃厚な果実味が特徴の赤ワインです。',
            another_result:'フランス ラングドック・ルーションのフルボディ赤' }
        ]
    },
    15 => {
        text: 'どんなスパークリングワインに惹かれますか？',
        choices: [
          { id: 'fruity', label: 'すっきりしてフルーティな味わい', result: 'イタリアのプロセッコ', image: 'sparkling_fruity.jpg', pairing: 'アペリティフ、軽い前菜、寿司',
            description: '爽やかな酸味とフルーティーな香りが特徴のスパークリングワインです。',
            another_result:'スペインのカヴァ、イタリアのフランチャコルタ' },
          { id: 'yeast', label: 'パンやナッツのような香り', result: 'フランスのシャンパーニュ', image: 'sparkling_yeast.jpg', pairing: 'お祝いの席、シーフード、クリーミーな料理',
            description: '複雑で深みのある味わいが特徴のスパークリングワインです。',
            another_result:'スペインのカヴァ・レセルバ' },
          { id: 'sweet', label: 'デザート感覚で飲める甘口', result: 'イタリアのアスティ・スプマンテ', image: 'sparkling_sweet.jpg', pairing: 'デザート、フルーツ、軽いおつまみ',
            description: '甘くてフルーティーな味わいが特徴のスパークリングワインです。',
            another_result:'イタリアのモスカート・ダスティ' }
        ]
    }
  }.freeze

  def self.all
    QUESTIONS
  end

  def self.find_step(step_id)
    QUESTIONS[step_id.to_i]
  end
end
