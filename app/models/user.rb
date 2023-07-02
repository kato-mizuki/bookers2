class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

          has_many :books, dependent: :destroy
          has_one_attached :image
          has_one_attached :profile_image

    def get_profile_image(width,height)
      unless profile_image.attached?
        file_path = Rails.root.join('app/assets/image/no_image.jpg')
      end
        get_profile_image.variant(resize_to_limit: [width, height]).processed
    end
end
