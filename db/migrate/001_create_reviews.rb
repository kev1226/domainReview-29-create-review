require_relative '../../config/database'

DB.create_table? :reviews do
  primary_key :id
  String :email
  String :comment
  Integer :rating
  String :product_id
  DateTime :created_at
end
