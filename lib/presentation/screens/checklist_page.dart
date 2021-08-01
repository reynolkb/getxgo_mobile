import 'package:bloc_architecture_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: CheckboxListTile(
            title: Text('Passport'),
            value: widget.passport,
            onChanged: (bool? value) {
              setState(() {
                widget.passport = value!;
              });
            },
          ),
        ),
        Container(
          child: CheckboxListTile(
            title: Text('Home Insurance'),
            value: widget.homeInsurance,
            onChanged: (bool? value) {
              setState(() {
                widget.homeInsurance = value!;
              });
            },
          ),
        ),
        Container(
          child: CheckboxListTile(
            title: Text('Auto Insurance'),
            value: widget.autoInsurance,
            onChanged: (bool? value) {
              setState(() {
                widget.autoInsurance = value!;
              });
            },
          ),
        ),
        Container(
          child: CheckboxListTile(
            title: Text('Medical Card'),
            value: widget.medicalCard,
            onChanged: (bool? value) {
              setState(() {
                widget.medicalCard = value!;
              });
            },
          ),
        ),
        Container(
          child: CheckboxListTile(
            title: Text('Social Security Card'),
            value: widget.socialSecurityCard,
            onChanged: (bool? value) {
              setState(() {
                widget.socialSecurityCard = value!;
              });
            },
          ),
        ),
        Container(
          child: CheckboxListTile(
            title: Text('Cash'),
            value: widget.cash,
            onChanged: (bool? value) {
              setState(() {
                widget.cash = value!;
              });
            },
          ),
        ),
        Container(
          child: CheckboxListTile(
            title: Text('Jacket'),
            value: widget.jacket,
            onChanged: (bool? value) {
              setState(() {
                widget.jacket = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
