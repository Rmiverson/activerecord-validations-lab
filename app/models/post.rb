require'pry'

class Post < ActiveRecord::Base
   validates_presence_of :title
   validates_length_of :content, :minimum => 250
   validates_length_of :summary, :maximum => 250
   validates :category, inclusion: %w(Fiction Non-Fiction)
   validate :is_clickbait_valid
   #   binding.pry 

   CLICKBAIT = ["Won't Believe", "Secret", "Top[number]", "Guess"]

   def is_clickbait_valid
      if title.present? && CLICKBAIT.none? { |z| title.match(z)}
         errors.add(:title, "doesnt sound clickbait-y enough")
      end
   end
end
