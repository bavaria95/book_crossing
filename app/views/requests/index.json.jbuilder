json.array!(@requests) do |request|
  json.extract! request, :id, :requester, :requested_book, :requested, :requester_book, :accepted
  json.url request_url(request, format: :json)
end
