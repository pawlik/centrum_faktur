require "helper"

describe "Connection" do
  before do
    CentrumFaktur.configure do |config|
      config.login     = "fake"
      config.password  = "fake"
      config.subdomain = "fake"
    end
  end

  it "should convert params to inline style" do
    params = CentrumFaktur::Connection.new.inline_params({:offset => 2, :limit => 10})
    assert_equal "offset=2&limit=10", params
  end

  it "should convert params to inline style with path" do
    path = CentrumFaktur::Connection.new.path_with_params("/api/1.0/invoices/", {:offset => 2, :limit => 10})
    assert_equal "/api/1.0/invoices/?offset=2&limit=10", path.to_s
  end

  it "should return path when no params provided" do
    path = CentrumFaktur::Connection.new.path_with_params("/api/1.0/invoices/", {})
    assert_equal "/api/1.0/invoices/", path.to_s
  end

  it "should return url to custom profile" do
    assert_equal "https://fake.centrumfaktur.pl", CentrumFaktur::Connection.new.uri.to_s
  end
end