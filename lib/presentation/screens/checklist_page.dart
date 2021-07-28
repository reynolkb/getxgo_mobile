import 'package:bloc_architecture_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class Checklist extends StatefulWidget {
  @override
  _ChecklistState createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  bool _isCheckedPassport = false;
  bool _isCheckedAutoInsurance = false;
  bool _isCheckedJacket = false;
  bool _isCheckedWallet = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: CheckboxListTile(
            title: Text('Passport'),
            value: _isCheckedPassport,
            onChanged: (bool? value) {
              setState(() {
                _isCheckedPassport = value!;
              });
            },
          ),
        ),
        Container(
          child: CheckboxListTile(
            title: Text('Auto Insurance'),
            value: _isCheckedAutoInsurance,
            onChanged: (bool? value) {
              setState(() {
                _isCheckedAutoInsurance = value!;
              });
            },
          ),
        ),
        Container(
          child: CheckboxListTile(
            title: Text('Jacket'),
            value: _isCheckedJacket,
            onChanged: (bool? value) {
              setState(() {
                _isCheckedJacket = value!;
              });
            },
          ),
        ),
        Container(
          child: CheckboxListTile(
            title: Text('Wallet'),
            value: _isCheckedWallet,
            onChanged: (bool? value) {
              setState(() {
                _isCheckedWallet = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
