class ClientsController < ApplicationController
  def find_by_nit
    client = Client.find_by(nit: params[:nit])
    if client
      render json: { client: { name: client.name } }
    else
      render json: { client: nil }
    end
  end

  # ...existing code...
end
