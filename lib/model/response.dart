class Response {

	List<dynamic> data;

	Response.fromJsonMap(Map<String, dynamic> map):
		data = map["data"];
}
