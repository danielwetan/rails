module ApiHelpers 
  def json 
    JSON.parse(response.body)
  end

  def custom_helper
    puts "custom spec helpers triggered"
  end
end