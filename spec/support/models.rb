class Post < ActiveRecord::Base
  before_create :generate_permalink
  
  private
  
  def generate_permalink
    self.permalink = title.parameterize
  end
end

Post.create(:title => "Hey there!", :text => "Thanks for using Find By Hash!", :category => "Feeling good")
Post.create(:title => "Sup, all?", :text => "How's things today?", :category => "Feeling good")