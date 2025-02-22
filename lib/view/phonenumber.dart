import 'package:flutter/material.dart';

class PhoneNumberField extends StatefulWidget {
  final Size size;

  const PhoneNumberField({Key? key, required this.size}) : super(key: key);

  @override
  _PhoneNumberFieldState createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  String selectedCountry = "Nepal (+977)";

  final List<String> countries = [
    "India (+91)",
    "Nepal (+977)",
    "USA (+1)",
    "UK (+44)",
    "Canada (+1)",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      height: 140,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black45,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Country/Region",
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        value: selectedCountry,
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down_sharp, size: 30),
                        underline: const SizedBox(), // Remove default underline
                        items: countries.map((String country) {
                          return DropdownMenuItem<String>(
                            value: country,
                            child: Text(
                              country,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCountry = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Phone number",
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
