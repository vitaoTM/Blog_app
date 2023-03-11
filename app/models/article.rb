class Article < ApplicationRecord
  validades :title, pesence: true, lenght: { minimun: 6, maximun: 50 }
  validades :description, presence: true lenght: { minimun: 6, maximun: 200 }
end
