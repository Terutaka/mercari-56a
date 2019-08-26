class Brand < ActiveHash::Base
  self.data = [
    {id: 1, name: 'シャネル'}, {id: 2, name: 'ルイヴィトン'}, {id: 3, name: 'ナエキ'},
    {id: 4, name: 'シュプリーム'}, {id: 5, name: 'アディダス'}
  ]
end
