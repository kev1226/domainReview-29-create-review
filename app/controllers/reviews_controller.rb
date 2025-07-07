require_relative '../models/review'

class ReviewsController
  def create(request, current_user)
    body = JSON.parse(request.body.read)

    review = Review.new(
      email: current_user['email'],
      comment: body['comment'],
      rating: body['rating'],
      product_id: body['product_id'],
      created_at: Time.now
    )

    if review.valid?
      review.save
      [201, { message: 'Comentario guardado' }.to_json]
    else
      [422, { error: review.errors.full_messages }.to_json]
    end
  end
end
