class Routes < Urns::Base

  get "/shipping/zones/new/?" do
    auth_admin
    @zone = Zone.new
    erb :"/shipping/zones/zones_edit", layout: "/layout_product".to_sym
  end

  post "/shipping/zones/new/?" do
    auth_admin
    zone = Zone.create(
      :zone       => params[:zone],
    )

    redirect "/shipping/zones/zones"
  end
  
  get "/shipping/zones/zones/?" do
    auth_admin
    @zone = Zone
    erb :"/shipping/zones/zones", layout: "/layout_product".to_sym
  end

  get "/shipping/zones/:id/edit/?" do
    auth_admin
    @zone = Zone[params[:id]]
    erb :"/shipping/zones/zones_edit", layout: "/layout_product".to_sym
  end

  post "/shipping/zones/:id/edit/?" do
    auth_admin
    zone = Zone.get[params[:id]]
    zone.update(
      :zone         => params[:zone]
    )

    redirect "/shipping/zones/zones"
  end

  get "/shipping/zones/:id/delete/?" do
    auth_admin
    zone = Zone.get[params[:id]]
    zone.destroy
    redirect "/shipping/zones/zones"
  end

end