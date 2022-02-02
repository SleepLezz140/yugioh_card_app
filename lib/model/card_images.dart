
class Card_images {

  String id;
  String image_url;
  String image_url_small;

	Card_images.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"].toString(),
		image_url = map["image_url"],
		image_url_small = map["image_url_small"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['image_url'] = image_url;
		data['image_url_small'] = image_url_small;
		return data;
	}
}
