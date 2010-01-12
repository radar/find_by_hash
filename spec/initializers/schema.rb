ActiveRecord::Schema.define do
  self.verbose = false
  
  create_table :posts, :force => true do |t|
    t.string :text, :permalink, :title, :category
    t.timestamps
  end
  
end