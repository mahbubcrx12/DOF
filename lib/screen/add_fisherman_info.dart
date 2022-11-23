import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


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

  List _genderList=["Male","Female"];
  final selectedGender="Male";



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
            color: Colors.green,
          ),
        ),
        title: Text(
          "Add fisherman info",
          style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextFormField(
                  controller: genderController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      labelText: "Gender",
                      hintText: "Gender",
                    suffixIcon:Icon(Icons.arrow_drop_down),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          gapPadding: 4.0,
                          borderSide:
                          BorderSide(color: Color(0xFF642E4C), width: 30))),
                  
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
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
                  onTap: ()async{
                    DateTime? pickedDate=await showDatePicker(

                        context: context,

                        initialDate: DateTime.now(),
                        firstDate: DateTime(1930),
                        lastDate: DateTime.now()
                    );
                    if(pickedDate != null){
                      setState(() {
                        dateOfBirthController.text=DateFormat("yyyy-MM-dd").format(pickedDate);
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
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
                          BorderSide(color: Color(0xFF642E4C), width: 30))),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.image,
                    size: 60,
                  )),
              SizedBox(
                height: 10,
              ),
              Text("Select an Image"),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(onPressed: () {}, child: Text("Submit")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
