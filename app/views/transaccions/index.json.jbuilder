json.array!(@transaccions) do |transaccion|
  json.extract! transaccion, :id, :client_id, :order_id, :payed, :detail, :pay_method, :status, :authorization_code, :paydate, :gateway_id, :total
  json.url transaccion_url(transaccion, format: :json)
end
