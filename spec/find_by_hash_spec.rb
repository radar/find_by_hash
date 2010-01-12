require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "The whole thing" do
  describe "find_by_hash" do
    it "finds by a hash containing one key" do
      
      Post.find_by_hash({ :title => "Hey there!" }).should_not be_nil
    end
    
    it "finds by a hash containing multiple keys" do
      Post.find_by_hash({ :permalink => "hey-there", :title => "Hey there!" }).should_not be_nil
    end
  
    it "errors if not passed a hash" do
      lambda { Post.find_by_hash([]) }.should raise_error(FindByHash::NotAHash)
    end
  end

  describe "find_all_by_hash" do
    it "finds all the posts" do
      Post.find_all_by_hash({ :category => "Feeling good" }).size.should eql(2)
    end
  end
  
  describe "find_or_create_by_hash" do
    it "creates a post because it doesn't exist" do
      Post.expects(:new).returns(post = stub)
      post.expects(:save).returns(true)
      Post.find_or_create_by_hash({ :title => "What's up dog?" })
    end
    
    it "finds a pre-existing record" do
      Post.expects(:new).never
      Post.find_or_create_by_hash({ :title => "Hey there!" })
    end
  end
  
  describe "find_or_initialize_by_hash" do
    it "initializes a new record" do
      Post.expects(:new).returns(post = stub)
      post.expects(:save).never
      Post.find_or_initialize_by_hash({ :title => "What's up dog?" })
    end
    
    it "finds a pre-existing record" do
      Post.expects(:new).never
      Post.find_or_initialize_by_hash({ :title => "Hey there!" })
    end
  end
end
