if @comment.persisted?
  json.inserted_item json.partial!("comments/_review.html.erb", comment: @comment)
end
