class User < ApplicationRecord
    has_one_attached :image
    validates :email, uniqueness: 
    {message: ': An account associated with %{value} already exists'}  
    validates :password, length: {in: 5..15}
end
