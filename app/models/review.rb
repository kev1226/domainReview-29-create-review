require_relative '../../config/database'

class Review < Sequel::Model(:reviews)
  def validate
    super
    errors.add(:product_id, 'cannot be empty') if product_id.nil? || product_id.to_s.strip.empty?
    errors.add(:comment, 'cannot be empty') if comment.nil? || comment.strip.empty?
    errors.add(:rating, 'must be between 1 and 5') unless rating && (1..5).include?(rating.to_i)
  end
end
