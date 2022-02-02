
class Card_prices {

  String cardmarket_price;
  String tcgplayer_price;
  String ebay_price;
  String amazon_price;

	Card_prices.fromJsonMap(List<dynamic> map):
		cardmarket_price = map.first["cardmarket_price"],
		tcgplayer_price = map.first["tcgplayer_price"],
		ebay_price = map.first["ebay_price"],
		amazon_price = map.first["amazon_price"];

	List<dynamic> toJson() {
		final List<dynamic> data = <dynamic>[];
		final Map<String, dynamic> value = Map();
		value['cardmarket_price'] = cardmarket_price;
		value['tcgplayer_price'] = tcgplayer_price;
		value['ebay_price'] = ebay_price;
		value['amazon_price'] = amazon_price;
		data.add(value);
		return data;
	}
}
