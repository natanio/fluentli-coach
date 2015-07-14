json.array!(@scheduled_calls) do |scheduled_call|
  json.extract! scheduled_call, :id, :suggested_time_1, :suggested_time_2, :suggested_time_3, :agreed_time, :price
  json.url scheduled_call_url(scheduled_call, format: :json)
end
