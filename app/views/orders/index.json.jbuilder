json.array!(@orders) do |order|
  json.extract! order, :id, :cart_id, :user_id, :order_date, :pay_type, :details, :price
  json.url order_url(order, format: :json)
end
