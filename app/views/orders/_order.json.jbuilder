json.extract! order, :id, :shop_id, :product_id, :customer_name, :customer_address, :created_at, :updated_at
json.url order_url(order, format: :json)
