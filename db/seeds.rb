# coding: utf-8
User.create!(
  [
    {
      nickname: 'taro',
      email: 't1@taro.com',
      first_name: '太郎',
      last_name: '山田',
      furigana_first: 'タロウ',
      furigana_last: 'ヤマダ',
      birthdate: '2010-07-11',
      tell: '00000000000',
      password: "tarotaro"
    },
    {
      nickname: 'jiro',
      email: 'te2@jiro.com',
      first_name: '二郎',
      last_name: '山田',
      furigana_first: 'ジロウ',
      furigana_last: 'ヤマダ',
      birthdate: '2010-06-11',
      tell: '00000000000',
      password: "jirojiro"
    },
    {
      nickname: 'ichiro',
      email: 'tes3@ichiro.com',
      first_name: '一郎',
      last_name: '山田',
      furigana_first: 'イチロウ',
      furigana_last: 'ヤマダ',
      birthdate: '2010-08-11',
      tell: '00000000000',
      password: "ichirouichirou"
    },
    {
      nickname: 'saburo',
      email: 'test4@saburo.com',
      first_name: '三郎',
      last_name: '山田',
      furigana_first: 'サブロウ',
      furigana_last: 'ヤマダ',
      birthdate: '2010-07-11',
      tell: '00000000000',
      password: "saburosaburo"
    },
  ]
)
Brand.create!(
  [
    {
      name: 'NIKE'
    },
    {
      name: 'GUCCI'
    },
    {
      name: 'ADDIDAS'
    },
    {
      name: 'LACOSTE'
    },
    {
      name: 'PUMA'
    },
    {
      name: 'CONVERSE'
    },
  ]
)
Item.create!(
  [
    {
      name: 'パーカー',
      description: 'パーカーです',
      price: 1000,
      condition: '',
      fee: 1,
      area: 3,
      shipping_days: 1,
      buyer: 2,
      brand_id: 1,
      user_id: 1,
    },
    # {
    #   name: 'スウェット',
    #   description: 'スウェットです',
    #   price: 2000,
    #   condition: '',
    #   image: 'clothes2.jpeg',
    #   fee: 200 ,
    #   area: 2,
    #   shipping_days: 2 ,
    #   buyer: 1 ,
    # },
    {
      name: 'ワンピース',
      description: 'ワンピースです',
      price: 3000,
      condition: '',
      fee: 2,
      area: 3,
      shipping_days: 3,
      buyer: '',
      brand_id: 2,
      user_id: 1,
    },
    {
      name: '靴',
      description: '靴です',
      price: 4000,
      condition: '',
      fee: 2,
      area: 3,
      shipping_days: 2,
      buyer: 2,
      brand_id: 3,
      user_id: 1,
    },
    {
      name: '子供服',
      description: '子供服です',
      price: 5000,
      condition: '',
      fee: 1,
      area: 2,
      shipping_days: 1,
      buyer: '',
      brand_id: 4,
      user_id: 2,
    },
    {
      name: 'スカート',
      description: 'スカートです',
      price: 6000,
      condition: '',
      fee: 1,
      area: 1,
      shipping_days: 3,
      buyer: 1,
      brand_id: 5,
      user_id: 3,
    },
    {
      name: 'バッグ',
      description: 'バッグです',
      price: 2000,
      condition: '',
      fee: 2,
      area: 1,
      shipping_days: 4,
      buyer: '',
      brand_id: 6,
      user_id: 4,
    },
    # {
    #   name: 'パンツ',
    #   description: 'パンツです',
    #   price: 6000,
    #   condition: '',
    #   fee: 1,
    #   area: 2,
    #   shipping_days: 2,
    #   buyer: 2,
    # },
  ]
)

Image.create!(
  [
    {
      content: 'clothes1.jpeg',
      item_id: 1,
    },
    {
      content: 'clothes3.jpeg',
      item_id: 2,
    },
    {
      content: 'clothes4.jpeg',
      item_id: 3,
    },
    {
      content: 'clothes5.jpeg',
      item_id: 4,
    },
    {
      content: 'clothes6.jpeg',
      item_id: 5,
    },
    {
      content: 'clothes7.jpeg',
      item_id: 6,
    },
  ]
)
