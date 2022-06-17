import 'dart:convert';

import 'package:http/http.dart';

class OpenseaApi {
  List? assets;
  int? error;
  int? id;
  Map? map;
  OpenseaApi({this.assets, this.error, this.map});
  Future<void> getApi() async {
    var uri = Uri.parse(
        "https://opensea13.p.rapidapi.com/assets?collection_slug=doodles-official&order_direction=desc&limit=20&include_orders=false");
    Map<String, String> header = {
      'X-RapidAPI-Key': '7bc9f390d3msh22d9698290555c5p1d962ejsn7e39abbb49ad',
      'X-RapidAPI-Host': 'opensea13.p.rapidapi.com'
    };
    Response response = await get(uri, headers: header);
    if (response.statusCode == 200) {
      Map data = await jsonDecode(response.body);
      assets = data['assets'];
      id = data["assets"][0]["id"];
      map = data;
    } else {
      error = response.statusCode;
    }
  }
}
