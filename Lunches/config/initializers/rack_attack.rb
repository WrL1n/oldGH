class Rack::Attack
  safelist('allow from localhost') do |req|
    # Requests are allowed if the return value is truthy
    '127.0.0.1' == req.ip || '::1' == req.ip
  end

  # Key: "rack::attack:#{Time.now.to_i/:period}:req/ip:#{req.ip}"
  throttle('req/ip', limit: 5, period: 1.second) { |req| req.ip }

  # Key: "rack::attack:#{Time.now.to_i/:period}:logins/ip:#{req.ip}"
  throttle('logins/ip', limit: 5, period: 2.minutes) do |req|
    req.ip if req.path == '/login' && req.post?
  end

  # return the email if present, nil otherwise
  throttle('logins/email', limit: 5, period: 2.minutes) do |req|
    req.params['email'].presence if req.path == '/login' && req.post?
  end
end
