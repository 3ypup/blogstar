class Post < ApplicationRecord

  validates :title, presence: {:message => "Выберите тему поста!!"}
  validates :title, :length => { :maximum => 40, :message => "Слишком длинная тема поста !!"}
  validates :author, presence: true
  validates :content, presence: {:message => "Напишите текст поста!!"}
  validates :content, :length => { :minimum => 123, :message => "Слишком короткий пост!! НУжно больше буков!!"}

  validates :mainpic, presence:  {:message => "Посту нужна обложка!!"}
  validates_format_of :mainpic,  :with => %r{(png|jpg|jpeg)}i, :message => "Неправильный формат файла !!"

mount_uploader :mainpic, PostimageUploader
end
