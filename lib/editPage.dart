import 'package:midterm/phoneContactClass.dart';
import 'package:midterm/viewContact.dart';
import 'package:midterm/midtermProvider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class EditContact extends StatefulWidget {
  @override
  _EditContactState createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  @override
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final firstphoneController = TextEditingController();
  final secondphoneController = TextEditingController();
  Widget build(BuildContext context) {
    var contactprov = Provider.of<MidTermProvider>(context);

    firstNameController.text =  '${contactprov.cont[contactprov.choosenIndex].Name1}';
    lastNameController.text =
        '${contactprov.cont[contactprov.choosenIndex].Name2}';
    firstphoneController.text =
        '${contactprov.cont[contactprov.choosenIndex].Phone1}';
    secondphoneController.text =
        '${contactprov.cont[contactprov.choosenIndex].Phone2}';
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              controller: firstNameController,
              decoration: InputDecoration(
                  labelText: 'First Name',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: lastNameController,
              decoration: InputDecoration(
                  labelText: 'last name',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
            ),
            TextField(
              keyboardType: TextInputType.phone,
              controller: firstphoneController,
              decoration: InputDecoration(
                  labelText: 'first phone ',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: secondphoneController,
              decoration: InputDecoration(
                  labelText: 'second phone',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    if ((firstNameController.text) != '' &&
                        (lastNameController.text) != '' &&
                        (firstphoneController.text) != '') {
                      contactprov.editContact(PhoneContactClass(
                        Name1: firstNameController.text,
                        Name2: lastNameController.text,
                        Phone1: firstphoneController.text,
                        Phone2: secondphoneController.text == null
                            ? ''
                            : secondphoneController.text,
                      ));

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewContacts()));
                    } else {
                      Fluttertoast.showToast(
                          msg: "please make sure to fill first,last name and first phone number",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 4,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  child: Text('Edit')),
            ),
              Container(
              child: SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('close'),
                ),
              ),)
          ],
        ),
      ),
    );
  }
}
