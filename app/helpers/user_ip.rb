require 'json'
require 'open-uri'

class UserIp
    def initialize(skate, ip)
        url = 'https://api.ipify.org/?format=json'
        user_serialized = URI.open(url).read
        @ip = ip     # JSON.parse(user_serialized)["ip"]
        results = Geocoder.search(@ip)
        @user_pos = results.first.coordinates
        @skate_pos = [skate.latitude, skate.longitude]
        @distancia = Geocoder::Calculations.distance_between(user_pos,skate_pos, :units => :km).round(2)
    end

    attr_reader :ip, :distancia, :user_pos, :skate_pos
  end


