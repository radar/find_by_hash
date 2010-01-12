# Find By Hash

Find By Hash is a library that does exactly what it says on the box: it finds by a Hash. It will improve all aspects of your life.

All methods require a hash to be passed to them, otherwise you'll get a `NotAHash` error.

## `find_by_hash`

Finds a single record based on the given hash. 

    Post.find_by_hash(:title => "Hey there!")

## `find_all_by_hash`

Finds all records based on the given hash.

    Post.find_all_by_hash(:title => "Hey there!")
    
## `find_or_create_by_hash`

Finds or creates a record based on the given hash.

    Post.find_or_create_by_hash(:title => "Hey there!")
    
## `find_or_initialize_by_hash`

Finds or initializes a record based on the given hash.

    Post.find_or_initialize_by_hash(:title => "Hey there!")