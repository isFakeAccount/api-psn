module PlayStationNetworkAPI
	class Catalog < Client
		attr_accessor :country, :language, :age
		def initialize(country = 'GB', language = 'en', age = '999')
			@country = country
			@language = language
			@age = age
		end

		# def products
		# 	raise 'Access Denied'
		# 	get([path, 'products'].join('/')).parsed_response
		# end
		
		# def product(product_id)
		# 	raise 'Access Denied'
		# 	get([path, 'products', product_id].join('/')).parsed_response
		# end
		
		# def cloud_games
		# 	raise 'Access Denied'
		# 	get([path, 'products', 'cloudgame'].join('/')).parsed_response
		# end
		
		# def sku(sku_id)
		# 	raise 'Access Denied'
		# 	get([path, 'skus', sku_id].join('/')).parsed_response
		# end
		
		# def category(category_id)
		# 	raise 'Access Denied'
		# 	get([path, 'categories', category_id].join('/')).parsed_response
		# end
		
		# def entitlement_tmdb(entitlement_id)
		# 	raise 'Access Denied'
		# 	get([path, 'entitlements', entitlement_id, 'tmdb'].join('/')).parsed_response
		# end
		
		# def entitlement_playgo_new(entitlement_id)
		# 	raise 'Access Denied'
		# 	get([path, 'entitlements', entitlement_id, 'tmdb', 'playgo'].join('/')).parsed_response
		# end
		
		# def entitlement_playgo(entitlement_id)
		# 	raise 'Access Denied'
		# 	warn "[DEPRECATED] This endpoint will go away, don't rely on it as things might break in the future!"
		# 	get([path, 'entitlements', entitlement_id, 'playgo'].join('/')).parsed_response
		# end

		# https://m.np.playstation.net/api/catalog/v2/concepts/fetch?country=GB&language=en&age=999&offset=4446
		def most_purchased(offset: 0, limit: 10)
			raise 'limit must be less than or equal to 1000' if limit > 1000
			warn "[DEPRECATED] This endpoint will go away, don't rely on it as things might break in the future!"

			get([path, 'concepts', 'fetch'].join('/'),
				query: {
					country: country,
					language: language,
					age: age,
					limit: limit,
					offset: offset
				}
			).parsed_response
		end

		# https://m.np.playstation.net/api/catalog/v2/fetch/concepts?country=GB&language=en&age=999
		def most_purchased_new
			raise 'Access Denied'
			get([path, 'fetch', 'concepts'].join('/')).parsed_response
		end

		def concepts
			raise 'Access Denied'
			get([path, 'concepts'].join('/')).parsed_response
		end

		# https://m.np.playstation.net/api/catalog/v2/concepts/10000470
		# https://m.np.playstation.net/api/catalog/v2/concepts/10000470?country=GB&language=en&age=999
		#
		# metadata [Boolean]: Different data is returned when true; stuff like age restrictions, release dates in different countries etc..
		def concept(concept_id, metadata: false)
			options = {}

			if metadata
				options[:query] = {
					country: country,
					language: language,
					age: age
				}
			end

			get([path, 'concepts', concept_id].join('/'), options).parsed_response
		end

		# https://m.np.playstation.net/api/catalog/v2/concepts/10000470/products?country=GB&language=en&age=999&limit=1000
		def products(concept_id, offset: 0, limit: 1000)
			raise 'limit must be less than or equal to 1000' if limit > 1000
			
			get([path, 'concepts', concept_id, 'products'].join('/'),
				query: {
					country: country,
					language: language,
					age: age,
					limit: limit,
					offset: offset
				}
			).parsed_response
		end

		# https://m.np.playstation.net/api/catalog/v2/titles/[..]/concepts/id
		# 
		def title_ids_to_concept_id(title_ids)
			raise 'limit must be less than or equal to 500' if title_ids.length > 500

			response = get([path, 'titles', title_ids, 'concepts', 'id'].join('/')).parsed_response
			
			return title_ids.length == 1 ? response[0] : response
		end

		# https://m.np.playstation.net/api/catalog/v2/titles/CUSA18182_00/?country=GB&language=en&age=999
		def title(title_id)
			get([path, 'title', title_id].join('/')).parsed_response
		end

		def title_age_limit(title_id)
			get([path, 'title', title_id, 'ageLimit'].join('/')).parsed_response
		end

		# https://m.np.playstation.net/api/catalog/v2/entitlements/EP1018-CUSA00054_00-MADMAXTHEGAME001?country=GB&language=en&age=999
		def entitlements(entitlement_id)
			raise 'Access Denied'
			get([path, 'entitlements', entitlement_id].join('/')).parsed_response
		end

	private

		def path
			'/catalog/v2'
		end
	end
end

# syncConcepts: function (t, n) {
# 	return {
# 		method: "GET",
# 		endpoint: "/v2/sync/concepts",
# 	};
# },
# getMainTmdbEntitlement: function (t, n) {
# 	return {
# 		method: "GET",
# 		endpoint: "/v2/titles/{titleId}/tmdb",
# 		urlParams: { titleId: c },
# 	};
# },
# fetchMostPurchasedProducts: function (t, n) {
# 	return {
# 		method: "GET",
# 		endpoint: "/v2/fetch/products",
# 	};
# },
# fetchMostPurchasedProductsDeprecatedAgain: function (t, n) {
# 	return {
# 		method: "GET",
# 		endpoint: "/v2/products/fetch",
# 	};
# },
