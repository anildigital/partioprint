if Rails.env == "development"
  Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].each do |file|
    require file
  end
end
