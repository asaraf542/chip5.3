class Movie < ActiveRecord::Base
  attr_accessible :title, :rating, :release_date
  def self.all_ratings
    return ['G','PG','PG-13','R']
  end
  
  def self.with_ratings(ratings)
#     return_list = []
#     Movie.all.each do |m|
#     if (ratings_list.include? m.rating)
#         return_list << m
#     end
#     return return_list
    if (ratings.length == 0)
      return Movie.all
    else
      return Movie.where("upper(rating) IN ?", ratings.map(&:upcase))
    end
  end 
end
