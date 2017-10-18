

class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :link_id, Serial
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!