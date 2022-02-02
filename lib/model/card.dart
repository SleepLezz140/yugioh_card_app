import 'package:yugioh_card_app/model/card_images.dart';
import 'package:yugioh_card_app/model/card_prices.dart';

class YugiohCard {

  String id;
  String name;
  String type;
  String desc;
  String race;
  String archetype;
  String attribute;
  List<Card_images> card_images;
  Card_prices card_prices;

	YugiohCard.fromJsonMap(Map<String, dynamic> map):
		id = map["id"].toString(),
		name = map["name"],
		type = map["type"],
		desc = map["desc"],
		race = map["race"],
		archetype = map["archetype"],
		card_images = List<Card_images>.from(map["card_images"].map((it) => Card_images.fromJsonMap(it))),
		card_prices = Card_prices.fromJsonMap(map["card_prices"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['name'] = name;
		data['type'] = type;
		data['desc'] = desc;
		data['race'] = race;
		data['archetype'] = archetype;
		data['card_images'] = card_images != null ? 
			this.card_images.map((v) => v.toJson()).toList()
			: null;
		data['card_prices'] = card_prices == null ? null : card_prices.toJson();
		return data;
	}
}
