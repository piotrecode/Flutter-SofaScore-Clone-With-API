// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class MyDropdownButton extends StatelessWidget {
  final String value;
  final ValueChanged<String?> onChanged;
  final List<DropdownMenuItem<String>> items;

  const MyDropdownButton({
    super.key,
    required this.value,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      onChanged: onChanged,
      items: items,
    );
  }
}

class Sports extends ChangeNotifier {
  String selectedSport = "1";

  void ChangeSport(String newSelectedSport) {
    selectedSport = newSelectedSport;
    notifyListeners();
  }
}

class _MyAppBarState extends State<MyAppBar> {
  String _selectedSport = "1";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color(0xFF1867B4),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.22,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.menu, color: Colors.white),
                      DropdownButton<String>(
                        hint: Text("football",
                            style: TextStyle(color: Colors.white)),
                        value: _selectedSport,
                        items: <String>['Football', 'Tennis', 'Basketball']
                            .map<DropdownMenuItem<String>>((String value) {
                          if (value == "Football") {
                            return DropdownMenuItem<String>(
                              value: "1",
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          } else if (value == "Tennis") {
                            return DropdownMenuItem<String>(
                              value: "5",
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          } else {
                            return DropdownMenuItem<String>(
                              value: "2",
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          }
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedSport = newValue!;

                            Provider.of<Sports>(context, listen: false)
                                .ChangeSport(_selectedSport);
                          });
                        },
                      ),
                      const Icon(Icons.calendar_month, color: Colors.white),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "LEAGUES",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "LIVE",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          "FAVORITES",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ])
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
