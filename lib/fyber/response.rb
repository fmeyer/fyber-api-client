module Fyber
    class Response
        include Enumerable
        attr_accessor :code, :message, :count, :pages, :information, :offers

        def initialize(response)
            load_response_header(response)
            load_response_offers(response) unless response.fetch("offers").empty?
        end

        def each(*args, &block)
            offers.each(*args, &block)
        end

        def [](key)
            offers[key]
        end

        def first
            offers[0]
        end

        def empty?
            count == 0
        end

        protected

        def load_response_header(response)
            @code = response.fetch("code")
            @message = response.fetch("message")
            @count = response.fetch("count")
            @pages = response.fetch("pages")
        end

        def load_response_offers(response)
            @offers = response.fetch("offers").map {|raw_offer| Offer.new(raw_offer)}
        end
    end

    class Offer

        attr_accessor   :title, :offer_id, :teaser, :required_actions, :link, :payout, :store_id, :offer_types,
                        :time_to_payout, :thumbnail

        def initialize(response)
            @title              = response.fetch("title")
            @offer_id           = response.fetch("offer_id")
            @teaser             = response.fetch("teaser")
            @required_actions   = response.fetch("required_actions")
            @link               = response.fetch("link")
            @payout             = response.fetch("payout")
            @store_id           = response.fetch("store_id")
            @offer_types        = load_offer_types(response.fetch("offer_types"))
            @time_to_payout     = TimeToPayout.new(*response.fetch("time_to_payout").values)
            @thumbnail          = Thumbnail.new(*response.fetch("thumbnail").values)
        end

        private

        def load_offer_types(offer_types)
            offer_types.map {|o| OfferType.new(*o.values)}
        end
    end

    OfferType    = Struct.new(:offer_type_id, :readable)
    TimeToPayout = Struct.new(:amount, :readable)
    Thumbnail    = Struct.new(:lowres, :hires)
end

