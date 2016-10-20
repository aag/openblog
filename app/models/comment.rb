class Comment < ApplicationRecord
  belongs_to :post, inverse_of: :comments

  validates :body, presence: { message: 'ist ein Pflichtfeld' }
  validates_format_of :body, with: /(\w+ \w+){4,}/, message: 'ist zu kurz (min. 5 Wörter)'
end
