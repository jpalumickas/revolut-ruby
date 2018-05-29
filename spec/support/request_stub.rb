def fixtures_dir
  File.expand_path('../fixtures', __dir__)
end

def fixture(file)
  File.new(File.join(fixtures_dir, "#{file}.json"))
end

def json_response(fixture_name)
  {
    body: fixture(fixture_name),
    headers: {
      content_type: 'application/json; charset=utf-8'
    }
  }
end

def base_url
  'https://b2b.revolut.com/api/1.0'
end

def stub_get_command(action, fixture, options = {})
  stub_request_command(:get, action, fixture, options)
end

def stub_delete_command(action, fixture, options = {})
  stub_request_command(:delete, action, fixture, options)
end

def stub_post_command(action, fixture, options = {})
  stub_request_command(:post, action, fixture, options)
end

def stub_put_command(action, fixture, options = {})
  stub_request_command(:put, action, fixture, options)
end

def stub_request_command(method, action, fixture, options = {})
  stub_request(method, "#{base_url}/#{action}")
    .with(query: options, headers: { 'Authorization' => 'Bearer test_key' })
    .to_return(json_response(fixture))
end
