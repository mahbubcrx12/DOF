import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:motsha_app/screen/search_fisherman.dart';
import '../model/fisherman_model.dart';
import 'package:http/http.dart' as http;

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
          elevation: 0,
          backgroundColor: Colors.green,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => SearchHere()));
                },
                child: Icon(
                  Icons.search_sharp,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: fishermanData.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Personal Information",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * .6,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(153, 123, 120, 120),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${fishermanData[index].fishermanNameBng}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "${fishermanData[index].fishermanNameEng}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Form ID: ${fishermanData[index].formId}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Date of Birth: ${fishermanData[index].dateOfBirth}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Education: ${fishermanData[index].education}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Gender: ${fishermanData[index].gender}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Marital Status: ${fishermanData[index].maritalStaus}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Mobile: ${fishermanData[index].mobile}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "NID: ${fishermanData[index].nationalIdNo}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Nationality: ${fishermanData[index].nationality}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Religion: ${fishermanData[index].religion}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Family Members: ${fishermanData[index].totalFamilyMember}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Father's Name(Bangla): ${fishermanData[index].fathersName}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Mother's Name: ${fishermanData[index].mothersName}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Number of Daughter: ${fishermanData[index].numberOfDaughter}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Number Of Son: ${fishermanData[index].numberOfSon}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Number Of Father: ${fishermanData[index].numberOfFather}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Number Of Mother: ${fishermanData[index].numberOfMother}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Number Of Spouse: ${fishermanData[index].numberOfSpouse}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Fisheries Information",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 400,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(20)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 60,
                      right: 20,
                      child: Container(
                        height: 150,
                        width: 150,
                        color: Colors.black,
                      ))
                ],
              );
            }));
  }
}
