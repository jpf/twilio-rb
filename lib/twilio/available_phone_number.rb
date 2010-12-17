module Twilio
  class AvailablePhoneNumber
    include Twilio::Resource 
    extend  Twilio::Finder

    class << self
      def all(opts={})
        opts                     = Hash[opts.map { |k,v| [k.to_s.camelize, v]}]
        country_code             = opts['IsoCountryCode'] ? opts.delete('IsoCountryCode') : 'US'
        number_type              = opts.delete('TollFree') ? 'TollFree' : 'Local'
        params                   = { :query => opts } if opts.any?

        handle_response get "/Accounts/#{Twilio::ACCOUNT_SID}/AvailablePhoneNumbers/#{country_code}/#{number_type}.json", params 
      end

      private :new

    end
  end
end
