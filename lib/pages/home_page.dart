import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanban/api_class.dart/get_openSeaApi.dart';
import 'package:kanban/pages/error_screen.dart';

import 'package:kanban/pages/loading_screen.dart';
import 'package:kanban/pages/market_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List? list;
Map? map;

class _HomePageState extends State<HomePage> {
  Future<void> testing() async {
    OpenseaApi openseaApi = OpenseaApi();
    await openseaApi.getApi();
    // get number of item in the list
    list = openseaApi.assets;
    // get diferent key and value
    map = openseaApi.map;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: testing(),
        builder: (context, snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.waiting:
              return const LoadingScreen();
              break;
            case ConnectionState.done:
              return ListView.builder(
                itemBuilder: (context, index) {
                  //convert to string
                  int iden = map?["assets"][index]["id"];

                  return Container(
                    margin: EdgeInsets.all(30.0),
                    padding: EdgeInsets.all(10.0),
                    color: Color(0xFF8185d6),
                    child: Column(children: [
                      Image(
                          image: NetworkImage(
                              "${map?["assets"][index]["image_preview_url"]}")),
                      Text(
                        iden.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(map?["assets"][index]["asset_contract"]["address"]),
                      Text(map?["assets"][index]["name"])
                    ]),
                  );
                },
                itemCount: list?.length,
              );
              break;
            default:
              return const ErrorScreen();
              break;
          }
        });
  }
}
