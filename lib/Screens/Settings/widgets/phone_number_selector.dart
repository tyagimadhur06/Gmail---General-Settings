 import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class PhoneNumberSelector extends StatefulWidget {
  const PhoneNumberSelector({Key? key}) : super(key: key);

  @override
  State<PhoneNumberSelector> createState() => _PhoneNumberSelectorState();
}

class _PhoneNumberSelectorState extends State<PhoneNumberSelector> {
  String? selectedCountry;
  GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CSCPicker(
            key: _cscPickerKey,
            showStates: false, // Disable state selection
            showCities: false,
            flagState: CountryFlag.DISABLE,
            defaultCountry: CscCountry.India,
            onCountryChanged: (country) {
              setState(() {
                selectedCountry = country;
              });
            },
            onStateChanged: (state) {},
            onCityChanged: (city) {},

            dropdownDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1),
            ),
          ),
        ],
      ),
    );
  }
}