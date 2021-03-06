class CentrumFaktur::Comment
  def self.list(comment_uri = "/api/1.0/comments/", options = {})
    request = CentrumFaktur::Connection.new.get(comment_uri, options)
    request.handle_response
  end

  def self.create(comment_uri, params)
    request = CentrumFaktur::Connection.new.post(comment_uri, params)
    request.handle_response
  end
end
