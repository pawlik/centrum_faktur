class CentrumFaktur::Account
  def self.list(options = {})
    request = CentrumFaktur::Connection.new.get("/api/1.0/accounts/", options)
    request.handle_response
  end
end
