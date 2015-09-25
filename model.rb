require 'open-uri'
require 'json'

class Model

  API_ENDPOINT = "https://health.data.ny.gov/resource/cnih-y5dw.json?"

  def self.get_best(city)
    sort_by_violations(get_all_by_city(city)).map{|data| Restaurant.new(data)}.take(10)
  end

  def self.get_worst(city)
    sort_by_violations(get_all_by_city(city)).map{|data| Restaurant.new(data)}.reverse.take(10)
  end

  def self.get_all_by_city(city)
    file = open(API_ENDPOINT + "city=#{city}")
    JSON.parse(file.read)
  end

  def self.sort_by_violations(restaurants)
    restaurants.sort do |restaurant_a, restaurant_b|
      unfixed_violations_sort = restaurant_a.fetch("total_crit_not_corrected", 0) <=> restaurant_b.fetch("total_crit_not_corrected", 0)
      critical_sort = restaurant_a.fetch("total_critical_violations", 0) <=> restaurant_b.fetch("total_critical_violations", 0)
      non_critical_sort = restaurant_a.fetch("total_noncritical_violations", 0) <=> restaurant_b.fetch("total_noncritical_violations", 0)
      if unfixed_violations_sort != 0
        unfixed_violations_sort
      elsif critical_sort != 0
        critical_sort
      else
        non_critical_sort
      end
    end
  end

end

class Restaurant
  attr_reader :name, :city, :critical, :critical_unfixed, :non_critical

  def initialize(args)
    @name = args.fetch("facility") {""}
    @city = args.fetch("city") {""}
    @critical_unfixed = args.fetch("total_crit_not_corrected") {0}
    @critical = args.fetch("total_critical_violations") {0}
    @non_critical = args.fetch("total_noncritical_violations") {0}
  end

  def to_s
    "#{name.rjust(30, ' ')}  #{critical_unfixed.rjust(28, ' ')} #{critical.rjust(23, ' ')} #{non_critical.rjust(26, ' ')}"
  end
end

