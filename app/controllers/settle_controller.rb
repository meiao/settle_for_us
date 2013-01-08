class SettleController < ApplicationController
  def settle
    client.search_venues(:ll => '36.142064,-86.816086')
  end
end
