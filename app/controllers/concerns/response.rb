module Response

  # Functon to output JSON object
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  # Functon to output JSON object also containing total price of all items
  def json_response_with_price(cost, object, status = :ok)
    render json: {total_cost:cost, items:object}, status: status
  end
end