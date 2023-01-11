// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import '../backend/api_calls.dart';

class GamesWidget extends StatefulWidget {
  final String selectedSportprov;
  const GamesWidget({super.key, required this.selectedSportprov});

  @override
  _GamesWidgetState createState() => _GamesWidgetState();
}

class _GamesWidgetState extends State<GamesWidget> {
  // List to hold the events\
  String selectedSport = "1";
  bool toggle = false;

  var _elements = [];
  @override
  void initState() {
    super.initState();

    // Fetch the events when the widget is initialized

    fetchEvents(selectedSport).then((events) {
      setState(() {
        _elements = events;
      });
    });
  }

  @override
  void didUpdateWidget(GamesWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedSportprov != widget.selectedSportprov) {
      fetchEvents(widget.selectedSportprov).then((events) {
        setState(() {
          _elements = events;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        SizedBox(
          height: 8,
        ),
        Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.02,
            color: Color(0xFFedf0f5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Live : ${_elements.length}",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.80,
          child: FutureBuilder<List<dynamic>>(
              future: fetchEvents(widget.selectedSportprov),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GroupedListView<dynamic, String>(
                    elements: _elements,
                    groupBy: (element) => element.tournamentName,
                    groupSeparatorBuilder: (String value) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (widget.selectedSportprov == "5")
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://upload.wikimedia.org/wikipedia/de/2/2e/ATP-World-Tour-Logo-weiss.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          if (widget.selectedSportprov == "1")
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://seeklogo.com/images/P/premier-league-new-logo-D22A0CE87E-seeklogo.com.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          if (widget.selectedSportprov == "2")
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://1000logos.net/wp-content/uploads/2017/04/Logo-NBA.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          Text(
                            value,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    itemBuilder: (ctx, element) {
                      return Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 50,
                                    child: Text("18:00",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14)),
                                  ),
                                  Container(
                                    width: 280,
                                    child: Row(
                                      children: [
                                        Text(element.homeTeamName,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal)),
                                        if (element.firstToServe == 1)
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://www.seekpng.com/png/full/15-153423_free-icons-png-green-tennis-ball-png.png'),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(element.homeTeamScore.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.red,
                                              fontWeight: FontWeight.normal)),
                                      SizedBox(
                                        width: 25,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 50,
                                    child: Text(
                                        element.information.length > 10
                                            ? element.information
                                                    .substring(0, 3) +
                                                ''
                                            : element.information,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 14)),
                                  ),
                                  Container(
                                    width: 280,
                                    child: Row(
                                      children: [
                                        Text(element.awayTeamName,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal)),
                                        if (element.firstToServe == 2)
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://www.seekpng.com/png/full/15-153423_free-icons-png-green-tennis-ball-png.png'),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(element.awayTeamScore.toString(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.red,
                                              fontWeight: FontWeight.normal)),
                                      SizedBox(
                                        width: 25,
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                              width: 25,
                              child: IconButton(
                                icon: Icon(
                                  element.isSelected
                                      ? Icons.notifications
                                      : Icons.notifications_none,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  setState(() {
                                    element.isSelected = !element.isSelected;
                                  });
                                },
                              )),
                        ],
                      );
                    },
                  );
                } else {
                  return Text("error");
                }
              }),
        ),
      ],
    ));
  }
}
