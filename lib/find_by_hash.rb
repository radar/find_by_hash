module FindByHash
  
  def self.included(base)
    base.extend ClassMethods
  end
  module ClassMethods
    def find_by_hash(hash)
      hash_find("find_by", hash)
    end
  
    def find_all_by_hash(hash)
      hash_find("find_all_by", hash)
    end
  
    def find_or_create_by_hash(hash)
      hash_find("find_or_create_by", hash)
    end
  
    def find_or_initialize_by_hash(hash)
      hash_find("find_or_initialize_by", hash)
    end
    
    private
      def syntax(object)
        raise NotAHash if !object.is_a?(Hash)
        object.keys.join("_and_")
      end
      
      def hash_find(finder="find_by", hash={})
        send(finder + "_" + syntax(hash), *hash.values)
      end
  end
  
  class NotAHash < Exception; end
end
  
  