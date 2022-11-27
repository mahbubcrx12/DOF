import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:motsha_app/service/http_service.dart';

import '../const/toast_message.dart';

class AddFisherMan extends StatefulWidget {
  const AddFisherMan({Key? key}) : super(key: key);

  @override
  State<AddFisherMan> createState() => _AddFisherManState();
}

class _AddFisherManState extends State<AddFisherMan> {
  TextEditingController fishermanNameBngController = TextEditingController();
  TextEditingController fishermanNameEngController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController mothersNameController = TextEditingController();
  TextEditingController fathersNameController = TextEditingController();
  TextEditingController divisionIdController = TextEditingController();
  TextEditingController districtIdController = TextEditingController();
  TextEditingController upazillaIdController = TextEditingController();
  TextEditingController postOfficeIdController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  String? gender;
  var _value = '-1';

  File? image;

  Future takeImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print("Failed to pick image :$e");
    }
  }

  bool onProgress = false;

  Future addFisherman() async {
    //  const Map<String, String> defaultHeader = {
    //   "Accept": "application/json",
    // };
    var link = Uri.parse("http://dof-demo.rdtl.xyz/api/fisher/add-data");
    var request = http.MultipartRequest("POST", link);
    request.headers.addAll(await HttpService.defaultHeader);
    request.fields["fishermanNameBng"] =
        fishermanNameEngController.text.toString();
    request.fields["fishermanNameEng"] =
        fishermanNameBngController.text.toString();
    request.fields["nationalId"] = nationalIdController.text.toString();
    request.fields["mobile"] = mobileController.text.toString();
    request.fields["gender"] = genderController.text.toString();
    request.fields["mothersName"] = mothersNameController.text.toString();
    request.fields["fathersName"] = fathersNameController.text.toString();
    request.fields["divisionId"] = divisionIdController.text.toString();
    request.fields["districtId"] = districtIdController.text.toString();
    request.fields["upazillaId"] = upazillaIdController.text.toString();
    request.fields["postOfficeId"] = postOfficeIdController.text.toString();
    var imageFile = await http.MultipartFile.fromPath("image", image!.path);
    request.files.add(imageFile);
    setState(() {
      onProgress = true;
    });
    var response = await request.send();
    var status = response.statusCode;
    print("ssssssssssssssssss $status");
    setState(() {
      onProgress = false;
    });
    var responseDataByte = await response.stream.toBytes();
    var responseDataString = String.fromCharCodes(responseDataByte);
    var data = jsonDecode(responseDataString);
    if (response.statusCode == 200) {
      showInToast("${data["message"]}");
      Navigator.of(context).pop();
    } else {
      showInToast("${data["message"]}");
    }

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
     fishermanNameBngController.clear();
     fishermanNameEngController.clear();
     nationalIdController.clear();
     mobileController.clear();
     genderController.clear();
     dateOfBirthController.clear();
     mothersNameController.clear();
     fathersNameController.clear();
     divisionIdController.clear();
     districtIdController.clear();
     upazillaIdController.clear();
     postOfficeIdController.clear();
     imageController.clear();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: InkWell(
          onTap: (() {
            Navigator.of(context).pop();
          }),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Add fisherman info",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextFormField(
                  controller: fishermanNameBngController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      labelText: "জেলের নাম",
                      hintText: "জেলের নাম",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          gapPadding: 4.0,
                          borderSide:
                              BorderSide(color: Color(0xFF642E4C), width: 30))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextFormField(
                  controller: fishermanNameEngController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      labelText: "Fisherman Name",
                      hintText: "Fisherman Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          gapPadding: 4.0,
                          borderSide:
                              BorderSide(color: Color(0xFF642E4C), width: 30))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextFormField(
                  controller: nationalIdController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      labelText: "NID Number",
                      hintText: "NID Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          gapPadding: 4.0,
                          borderSide:
                              BorderSide(color: Color(0xFF642E4C), width: 30))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextFormField(
                  controller: mobileController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      labelText: "Mobile Number",
                      hintText: "Mobile Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          gapPadding: 4.0,
                          borderSide:
                              BorderSide(color: Color(0xFF642E4C), width: 30))),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          labelText: "Gender",
                          hintText: "Gender",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              gapPadding: 4.0,
                              borderSide: BorderSide(
                                  color: Color(0xFF642E4C), width: 30))),
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text("---select Gender---"),
                          value: '-1',
                        ),
                        DropdownMenuItem(
                          child: Text("Male"),
                          value: '0',
                        ),
                        DropdownMenuItem(
                          child: Text("Female"),
                          value: '1',
                        )
                      ],
                      onChanged: (v) {
                        genderController != v;
                      })),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextFormField(
                  controller: dateOfBirthController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      labelText: "Date Of Birth",
                      hintText: "Date Of Birth",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          gapPadding: 4.0,
                          borderSide:
                              BorderSide(color: Color(0xFF642E4C), width: 30))),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1930),
                        lastDate: DateTime.now());
                    if (pickedDate != null) {
                      setState(() {
                        dateOfBirthController.text =
                            DateFormat("yyyy-MM-dd").format(pickedDate);
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextFormField(
                  controller: mothersNameController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      labelText: "Mother's Name",
                      hintText: "Mother's Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          gapPadding: 4.0,
                          borderSide:
                              BorderSide(color: Color(0xFF642E4C), width: 30))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextFormField(
                  controller: fathersNameController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      labelText: "Father's Name",
                      hintText: "Father's Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          gapPadding: 4.0,
                          borderSide:
                              BorderSide(color: Color(0xFF642E4C), width: 30))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextFormField(
                  controller: divisionIdController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      labelText: "Division",
                      hintText: "Division",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          gapPadding: 4.0,
                          borderSide:
                              BorderSide(color: Color(0xFF642E4C), width: 30))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextFormField(
                  controller: districtIdController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      labelText: "District",
                      hintText: "District",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          gapPadding: 4.0,
                          borderSide:
                              BorderSide(color: Color(0xFF642E4C), width: 30))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextFormField(
                  controller: upazillaIdController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      labelText: "Upazilla",
                      hintText: "Upazilla",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          gapPadding: 4.0,
                          borderSide:
                              BorderSide(color: Color(0xFF642E4C), width: 30))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextFormField(
                  controller: postOfficeIdController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      labelText: "Post Office",
                      hintText: "Post Office",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          gapPadding: 4.0,
                          borderSide:
                              BorderSide(color: Colors.green, width: 30))),
                ),
              ),
              InkWell(
                onTap: () {
                  takeImage();
                },
                child: image == null
                    ? Container(
                        height: MediaQuery.of(context).size.height * .25,
                        width: MediaQuery.of(context).size.width * .5,
                        color: Colors.green.withOpacity(.35),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 80,
                            color: Colors.green,
                          ),
                        ),
                      )
                    : Image.file(
                        File(image!.path),
                        height: 200,
                        width: 250,
                        fit: BoxFit.cover,
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "Upload an Image",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(13)),
                      child: InkWell(
                        onTap: () {
                          addFisherman();
                          //Navigator.of(context).pop();
                        },
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
