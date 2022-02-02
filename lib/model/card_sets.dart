
class Card_sets {

  String set_name;
  String set_code;
  String set_rarity;
  String set_price;

	Card_sets.fromJsonMap(Map<String, dynamic> map): 
		set_name = map["set_name"],
		set_code = map["set_code"],
		set_rarity = map["set_rarity"],
		set_price = map["set_price"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['set_name'] = set_name;
		data['set_code'] = set_code;
		data['set_rarity'] = set_rarity;
		data['set_price'] = set_price;
		return data;
	}
}
