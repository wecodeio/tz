require "tzinfo"

require_relative "tz/version"

module TZ
  class TimeWithZone
    MAPPING = {
      "International Date Line West" => "Pacific/Midway",
      "Midway Island"                => "Pacific/Midway",
      "American Samoa"               => "Pacific/Pago_Pago",
      "Hawaii"                       => "Pacific/Honolulu",
      "Alaska"                       => "America/Juneau",
      "Pacific Time (US & Canada)"   => "America/Los_Angeles",
      "Tijuana"                      => "America/Tijuana",
      "Mountain Time (US & Canada)"  => "America/Denver",
      "Arizona"                      => "America/Phoenix",
      "Chihuahua"                    => "America/Chihuahua",
      "Mazatlan"                     => "America/Mazatlan",
      "Central Time (US & Canada)"   => "America/Chicago",
      "Saskatchewan"                 => "America/Regina",
      "Guadalajara"                  => "America/Mexico_City",
      "Mexico City"                  => "America/Mexico_City",
      "Monterrey"                    => "America/Monterrey",
      "Central America"              => "America/Guatemala",
      "Eastern Time (US & Canada)"   => "America/New_York",
      "Indiana (East)"               => "America/Indiana/Indianapolis",
      "Bogota"                       => "America/Bogota",
      "Lima"                         => "America/Lima",
      "Quito"                        => "America/Lima",
      "Atlantic Time (Canada)"       => "America/Halifax",
      "Caracas"                      => "America/Caracas",
      "La Paz"                       => "America/La_Paz",
      "Santiago"                     => "America/Santiago",
      "Newfoundland"                 => "America/St_Johns",
      "Brasilia"                     => "America/Sao_Paulo",
      "Buenos Aires"                 => "America/Argentina/Buenos_Aires",
      "Montevideo"                   => "America/Montevideo",
      "Georgetown"                   => "America/Guyana",
      "Greenland"                    => "America/Godthab",
      "Mid-Atlantic"                 => "Atlantic/South_Georgia",
      "Azores"                       => "Atlantic/Azores",
      "Cape Verde Is."               => "Atlantic/Cape_Verde",
      "Dublin"                       => "Europe/Dublin",
      "Edinburgh"                    => "Europe/London",
      "Lisbon"                       => "Europe/Lisbon",
      "London"                       => "Europe/London",
      "Casablanca"                   => "Africa/Casablanca",
      "Monrovia"                     => "Africa/Monrovia",
      "UTC"                          => "Etc/UTC",
      "Belgrade"                     => "Europe/Belgrade",
      "Bratislava"                   => "Europe/Bratislava",
      "Budapest"                     => "Europe/Budapest",
      "Ljubljana"                    => "Europe/Ljubljana",
      "Prague"                       => "Europe/Prague",
      "Sarajevo"                     => "Europe/Sarajevo",
      "Skopje"                       => "Europe/Skopje",
      "Warsaw"                       => "Europe/Warsaw",
      "Zagreb"                       => "Europe/Zagreb",
      "Brussels"                     => "Europe/Brussels",
      "Copenhagen"                   => "Europe/Copenhagen",
      "Madrid"                       => "Europe/Madrid",
      "Paris"                        => "Europe/Paris",
      "Amsterdam"                    => "Europe/Amsterdam",
      "Berlin"                       => "Europe/Berlin",
      "Bern"                         => "Europe/Berlin",
      "Rome"                         => "Europe/Rome",
      "Stockholm"                    => "Europe/Stockholm",
      "Vienna"                       => "Europe/Vienna",
      "West Central Africa"          => "Africa/Algiers",
      "Bucharest"                    => "Europe/Bucharest",
      "Cairo"                        => "Africa/Cairo",
      "Helsinki"                     => "Europe/Helsinki",
      "Kyiv"                         => "Europe/Kiev",
      "Riga"                         => "Europe/Riga",
      "Sofia"                        => "Europe/Sofia",
      "Tallinn"                      => "Europe/Tallinn",
      "Vilnius"                      => "Europe/Vilnius",
      "Athens"                       => "Europe/Athens",
      "Istanbul"                     => "Europe/Istanbul",
      "Minsk"                        => "Europe/Minsk",
      "Jerusalem"                    => "Asia/Jerusalem",
      "Harare"                       => "Africa/Harare",
      "Pretoria"                     => "Africa/Johannesburg",
      "Moscow"                       => "Europe/Moscow",
      "St. Petersburg"               => "Europe/Moscow",
      "Volgograd"                    => "Europe/Moscow",
      "Kuwait"                       => "Asia/Kuwait",
      "Riyadh"                       => "Asia/Riyadh",
      "Nairobi"                      => "Africa/Nairobi",
      "Baghdad"                      => "Asia/Baghdad",
      "Tehran"                       => "Asia/Tehran",
      "Abu Dhabi"                    => "Asia/Muscat",
      "Muscat"                       => "Asia/Muscat",
      "Baku"                         => "Asia/Baku",
      "Tbilisi"                      => "Asia/Tbilisi",
      "Yerevan"                      => "Asia/Yerevan",
      "Kabul"                        => "Asia/Kabul",
      "Ekaterinburg"                 => "Asia/Yekaterinburg",
      "Islamabad"                    => "Asia/Karachi",
      "Karachi"                      => "Asia/Karachi",
      "Tashkent"                     => "Asia/Tashkent",
      "Chennai"                      => "Asia/Kolkata",
      "Kolkata"                      => "Asia/Kolkata",
      "Mumbai"                       => "Asia/Kolkata",
      "New Delhi"                    => "Asia/Kolkata",
      "Kathmandu"                    => "Asia/Kathmandu",
      "Astana"                       => "Asia/Dhaka",
      "Dhaka"                        => "Asia/Dhaka",
      "Sri Jayawardenepura"          => "Asia/Colombo",
      "Almaty"                       => "Asia/Almaty",
      "Novosibirsk"                  => "Asia/Novosibirsk",
      "Rangoon"                      => "Asia/Rangoon",
      "Bangkok"                      => "Asia/Bangkok",
      "Hanoi"                        => "Asia/Bangkok",
      "Jakarta"                      => "Asia/Jakarta",
      "Krasnoyarsk"                  => "Asia/Krasnoyarsk",
      "Beijing"                      => "Asia/Shanghai",
      "Chongqing"                    => "Asia/Chongqing",
      "Hong Kong"                    => "Asia/Hong_Kong",
      "Urumqi"                       => "Asia/Urumqi",
      "Kuala Lumpur"                 => "Asia/Kuala_Lumpur",
      "Singapore"                    => "Asia/Singapore",
      "Taipei"                       => "Asia/Taipei",
      "Perth"                        => "Australia/Perth",
      "Irkutsk"                      => "Asia/Irkutsk",
      "Ulaanbaatar"                  => "Asia/Ulaanbaatar",
      "Seoul"                        => "Asia/Seoul",
      "Osaka"                        => "Asia/Tokyo",
      "Sapporo"                      => "Asia/Tokyo",
      "Tokyo"                        => "Asia/Tokyo",
      "Yakutsk"                      => "Asia/Yakutsk",
      "Darwin"                       => "Australia/Darwin",
      "Adelaide"                     => "Australia/Adelaide",
      "Canberra"                     => "Australia/Melbourne",
      "Melbourne"                    => "Australia/Melbourne",
      "Sydney"                       => "Australia/Sydney",
      "Brisbane"                     => "Australia/Brisbane",
      "Hobart"                       => "Australia/Hobart",
      "Vladivostok"                  => "Asia/Vladivostok",
      "Guam"                         => "Pacific/Guam",
      "Port Moresby"                 => "Pacific/Port_Moresby",
      "Magadan"                      => "Asia/Magadan",
      "Solomon Is."                  => "Pacific/Guadalcanal",
      "New Caledonia"                => "Pacific/Noumea",
      "Fiji"                         => "Pacific/Fiji",
      "Kamchatka"                    => "Asia/Kamchatka",
      "Marshall Is."                 => "Pacific/Majuro",
      "Auckland"                     => "Pacific/Auckland",
      "Wellington"                   => "Pacific/Auckland",
      "Nuku'alofa"                   => "Pacific/Tongatapu",
      "Tokelau Is."                  => "Pacific/Fakaofo",
      "Chatham Is."                  => "Pacific/Chatham",
      "Samoa"                        => "Pacific/Apia"
    }.freeze
    
    ONE_HOUR_IN_SECS = 3600
    ONE_HOUR_IN_MINS = 60
    TIME_FORMAT = "%02d".freeze
    
    attr_reader :time_zone
    
    # Public: Class constructor.
    #
    # date_or_time - The Date, Time or DateTime object to be formatted.
    # time_zone - The ActiveSupport String specifying the target time zone.
    #
    # Examples
    #
    #   TZ::TimeWithZone.new(Time.now.utc, "Eastern Time (US & Canada)")
    #   # => an instance of the TZ::TimeWithZone class
    #
    # Returns a fresh TZ::TimeWithZone object.
    def initialize(date_or_time, time_zone)
      @utc_object = to_utc(date_or_time)
      @time_zone = begin
        tz = MAPPING[time_zone]
        TZInfo::Timezone.get(tz)
      end
    end

    # Public: formats the input date/time/datetime object.
    #
    # Examples
    #
    #   TZ::TimeWithZone.new(Time.now.utc, "Eastern Time (US & Canada)")
    #   # => "Sat, 07 Jun 2014 17:23:53 EDT -04:00"
    #
    # Returns the formatted String version of the input date/time/datetime object.
    def in_time_zone
      "#{formatted_local_time} #{time_zone_code} #{formatted_time}"
    end
    
  private
  
    def formatted_local_time
      local_time.rfc822.split(" ")[0..-2].join(" ")
    end
  
    def time_zone_code
      period.zone_identifier
    end
  
    def formatted_time
      offset = period.offset.utc_total_offset
      hours, minutes = offset.divmod(ONE_HOUR_IN_SECS)
      minutes /= ONE_HOUR_IN_MINS
      sign = hours < 0 ? "-" : "+"
      padded_hours = TIME_FORMAT % hours.abs
      padded_minutes = TIME_FORMAT % minutes
      "#{sign}#{padded_hours}:#{padded_minutes}"
    end
  
    def period
      @period ||= @time_zone.period_for_utc(@utc_object)
    end
  
    def local_time
      @time_zone.utc_to_local(@utc_object)
    end
  
    def to_utc(date_or_time)
      return date_or_time.to_datetime.to_time.utc if date_or_time.is_a?(Date)
      return date_or_time.utc if date_or_time.respond_to?(:utc?) && !date_or_time.utc? &&
               date_or_time.respond_to?(:utc)
               
      date_or_time
    end
  end
end
