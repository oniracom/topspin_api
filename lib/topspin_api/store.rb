module TopspinApi

  class Store
    include Client
    include Pagination

    def initialize(api_user, api_key)
      @prefix = "v1/offers"
      authenticate(api_user, api_key)
    end

    # Get an array of all the offers available at this artist's store.
    # It's a paginated list.
    def offers(artist_id, options = {})
      #options[:tag_name] = "ts_all_products" unless options[:tag_name]
      #options[:page] = 1 unless options[:page]
      options[:artist_id] = artist_id
      options[:offer_type] = 'email_for_media'
      hash = fetch_json("/", options)
      decorate(hash, hash["offers"])
    end

    # Get detailed information about an offer
    def detail(offer_id)
      fetch_json("detail/#{offer_id}")
    end

  end

end