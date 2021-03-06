import 'package:bloc_architecture_app/presentation/screens/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';

// ignore: must_be_immutable
class Checklist extends StatefulWidget {
  String objectId;
  bool passport;
  bool homeInsurance;
  bool autoInsurance;
  bool medicalCard;
  bool socialSecurityCard;
  bool cash;
  bool jacket;

  Checklist({
    required this.objectId,
    required this.passport,
    required this.homeInsurance,
    required this.autoInsurance,
    required this.medicalCard,
    required this.socialSecurityCard,
    required this.cash,
    required this.jacket,
  });

  @override
  _ChecklistState createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  late XFile imageFile;

  _openCamera() async {
    var picture = await ImagePicker().pickImage(source: ImageSource.camera);
    GallerySaver.saveImage(picture!.path, albumName: 'GetxGo');
    Message.showSuccess(
        context: context,
        message:
            'Image was saved to GetxGo album on your phone. Please print out your docs',
        onPressed: () {
          // Navigator.of(context).pushNamed('user_page');
          setState(() {});
        });
  }

  Future<ParseResponse> updateChecklist(
    String objectId,
    bool passport,
    bool homeInsurance,
    bool autoInsurance,
    bool medicalCard,
    bool socialSecurityCard,
    bool cash,
    bool jacket,
  ) async {
    var checklist = ParseObject('Checklist')
      ..objectId = objectId
      ..set('passport', passport)
      ..set('homeInsurance', homeInsurance)
      ..set('autoInsurance', autoInsurance)
      ..set('medicalCard', medicalCard)
      ..set('socialSecurityCard', socialSecurityCard)
      ..set('cash', cash)
      ..set('jacket', jacket);
    final apiResponse = await checklist.save();
    return apiResponse;
  }

  @override
  Widget build(BuildContext context) {
    void saveChecklist() async {
      var response = await updateChecklist(
          widget.objectId,
          widget.passport,
          widget.homeInsurance,
          widget.autoInsurance,
          widget.medicalCard,
          widget.socialSecurityCard,
          widget.cash,
          widget.jacket);
      if (response.success) {
        Message.showSuccess(
            context: context,
            message: 'Checklist was successfully saved.',
            onPressed: () {
              // Navigator.of(context).pushNamed('user_page');
              setState(() {});
            });
      } else {
        Message.showError(context: context, message: response.error!.message);
      }
    }

    return new SingleChildScrollView(
        child: new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 5.0,
            bottom: 20.0,
          ),
          child: CheckboxListTile(
            title: Text('Passport',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffDF7C39),
                )),
            checkColor: Colors.white,
            activeColor: Color(0xffDF7C39),
            value: widget.passport,
            onChanged: (bool? value) {
              setState(() {
                widget.passport = value!;
              });
            },
            secondary: Container(
              height: 50,
              child: ElevatedButton(
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 30.0,
                ),
                onPressed: () => _openCamera(),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(5, 5),
                  primary: Color(0xffDF7C39),
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            bottom: 20.0,
          ),
          child: CheckboxListTile(
            title: Text('Home Insurance',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffDF7C39),
                )),
            checkColor: Colors.white,
            activeColor: Color(0xffDF7C39),
            value: widget.homeInsurance,
            onChanged: (bool? value) {
              setState(() {
                widget.homeInsurance = value!;
              });
            },
            secondary: Container(
              height: 50,
              child: ElevatedButton(
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 30.0,
                ),
                onPressed: () => _openCamera(),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffDF7C39),
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            bottom: 20.0,
          ),
          child: CheckboxListTile(
            title: Text('Auto Insurance',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffDF7C39),
                )),
            checkColor: Colors.white,
            activeColor: Color(0xffDF7C39),
            value: widget.autoInsurance,
            onChanged: (bool? value) {
              setState(() {
                widget.autoInsurance = value!;
              });
            },
            secondary: Container(
              height: 50,
              child: ElevatedButton(
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 30.0,
                ),
                onPressed: () => _openCamera(),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffDF7C39),
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            bottom: 20.0,
          ),
          child: CheckboxListTile(
            title: Text('Medical Card',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffDF7C39),
                )),
            checkColor: Colors.white,
            activeColor: Color(0xffDF7C39),
            value: widget.medicalCard,
            onChanged: (bool? value) {
              setState(() {
                widget.medicalCard = value!;
              });
            },
            secondary: Container(
              height: 50,
              child: ElevatedButton(
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 30.0,
                ),
                onPressed: () => _openCamera(),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffDF7C39),
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            bottom: 20.0,
          ),
          child: CheckboxListTile(
            title: Text('Social Security Card',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffDF7C39),
                )),
            checkColor: Colors.white,
            activeColor: Color(0xffDF7C39),
            value: widget.socialSecurityCard,
            onChanged: (bool? value) {
              setState(() {
                widget.socialSecurityCard = value!;
              });
            },
            secondary: Container(
              height: 50,
              child: ElevatedButton(
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 30.0,
                ),
                onPressed: () => _openCamera(),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffDF7C39),
                ),
              ),
            ),
          ),
        ),
        Container(
          child: CheckboxListTile(
            title: Text('Cash',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2c5977),
                )),
            checkColor: Colors.white,
            activeColor: Color(0xff2c5977),
            value: widget.cash,
            onChanged: (bool? value) {
              setState(() {
                widget.cash = value!;
              });
            },
            secondary: Container(
                height: 50,
                width: 50,
                child: Icon(
                  Icons.cases_sharp,
                  size: 40.0,
                  color: Color(0xff2c5977),
                )),
          ),
        ),
        Container(
          child: CheckboxListTile(
            title: Text('Jacket',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2c5977),
                )),
            checkColor: Colors.white,
            activeColor: Color(0xff2c5977),
            value: widget.jacket,
            onChanged: (bool? value) {
              setState(() {
                widget.jacket = value!;
              });
            },
            secondary: Container(
                height: 50,
                width: 50,
                child: Icon(
                  Icons.cases_sharp,
                  size: 40.0,
                  color: Color(0xff2c5977),
                )),
          ),
        ),
        Container(
          height: 50,
          child: ElevatedButton(
            child: Icon(
              Icons.camera_alt_outlined,
              size: 30.0,
            ),
            onPressed: () => _openCamera(),
            style: ElevatedButton.styleFrom(
              primary: Color(0xffDF7C39),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 50,
          child: ElevatedButton(
            child: const Text('Save Checklist'),
            onPressed: () => saveChecklist(),
            style: ElevatedButton.styleFrom(
              primary: Color(0xff2c5977),
            ),
          ),
        ),
      ],
    ));
  }
}
