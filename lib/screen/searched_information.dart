import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/fisherman_model.dart';
import 'package:http/http.dart' as http;
import '../provider/notice_provider.dart';

class SearchFisherMan extends StatefulWidget {
  SearchFisherMan({Key? key, required this.searchInput}) : super(key: key);
  String searchInput;
  @override
  State<SearchFisherMan> createState() => _SearchFisherManState();
}

class _SearchFisherManState extends State<SearchFisherMan> {
  List<Data> fishermanData = [];
  Future<dynamic> fetchFisherman(searchInput) async {
    try {
      var link =
          "http://dof-demo.rdtl.xyz/api/fisher/get-details/${searchInput}";
      var response = await http.get(Uri.parse(link));

      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        print("ggggggggggggg $data");

        Data fisharData;
        for (var i in data['data']) {
          fisharData = Data.fromJson(i);
          fishermanData.add(fisharData);
          print("aaaaaaaaaaaaaaaaaaaaaaaaaa$fishermanData");
        }

        return fishermanData;
      } else {
        return fishermanData;
      }
    } catch (e) {
      print("Errrrrrr $e");
      return fishermanData;
    }
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await fetchFisherman(widget.searchInput);
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          title: Text(
            "Search Result",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: fishermanData.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.amber,
                child: Text("${fishermanData[index].fathersName}"),
              );
            }));
  }
}
