module PlayStationNetworkAPI
  module Models
    class Trophy
      attr_writer :titles, :results

      def initialize(object)
        @titles = object['trophyTitles']
        @results = object['totalItemCount']
      end
    end
  end
end