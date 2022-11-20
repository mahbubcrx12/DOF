import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddFisherMan extends StatefulWidget {
  const AddFisherMan({Key? key}) : super(key: key);

  @override
  State<AddFisherMan> createState() => _AddFisherManState();
}

class _AddFisherManState extends State<AddFisherMan> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: "Enter name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        gapPadding: 4.0,
                        borderSide:
                            BorderSide(color: Color(0xFF642E4C), width: 30))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: "Enter phone number",
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
    );
  }
}
