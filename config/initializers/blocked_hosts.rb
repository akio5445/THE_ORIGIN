Rails.application.configure do
# You can use blocked_hosts.rb to restrict domain names from rails6
  config.hosts << "example.com"
  config.hosts << "origin.example.com"
end
