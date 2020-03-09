# coding: utf-8
Item.create!(
  [
    {
      name: 'パーカー',
      description: 'パーカーです',
      price: 1000,
      condition: '',
      fee: 100,
      area: 3,
      shipping_days: 1,
      buyer: 2,
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
      fee: 300,
      area: 3,
      shipping_days: 3,
      buyer: '',
    },
    {
      name: '靴',
      description: '靴です',
      price: 4000,
      condition: '',
      fee: 200,
      area: 3,
      shipping_days: 2,
      buyer: 2,
    },
    {
      name: '子供服',
      description: '子供服です',
      price: 5000,
      condition: '',
      fee: 100,
      area: 2,
      shipping_days: 1,
      buyer: '',
    },
    {
      name: 'スカート',
      description: 'スカートです',
      price: 6000,
      condition: '',
      fee: 500,
      area: 1,
      shipping_days: 3,
      buyer: 1,
    },
    {
      name: 'バッグ',
      description: 'バッグです',
      price: 2000,
      condition: '',
      fee: 200,
      area: 1,
      shipping_days: 4,
      buyer: '',
    },
    # {
    #   name: 'パンツ',
    #   description: 'パンツです',
    #   price: 6000,
    #   condition: '',
    #   fee: 400,
    #   area: 2,
    #   shipping_days: 2,
    #   buyer: 2,
    # },
  ]
)

Image.create!(
  [
    {
      content: 'clothes1.jpeg'
    },
    {
      content: 'clothes3.jpeg'
    },
    {
      content: 'clothes4.jpeg'
    },
    {
      content: 'clothes5.jpeg'
    },
    {
      content: 'clothes6.jpeg'
    },
    {
      content: 'clothes7.jpeg'
    },
  ]
)