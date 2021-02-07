module IexTool
  @client = IEX::Api::Client.new(publishable_token:Rails.application.credentials.iex[:publish_key],secret_token:Rails.application.credentials.iex[:secret_key])

  def self.get_stock_details(symbol)
    begin
      quote = @client.quote(symbol)
      return {name:quote.company_name,latest_price:quote.latest_price,symbol:symbol}
    rescue => exception
      nil
    end
  end  
end