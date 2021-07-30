import 'package:bloc_architecture_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class Checklist extends StatefulWidget {
  bool passport;
  bool autoInsurance;
  Checklist({required this.passport, required this.autoInsurance});

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
