import 'package:http/http.dart' as http;
import 'dart:convert';

class Event {
  final String homeTeamName;
  final String awayTeamName;
  final String tournamentName;
  final String information;
  final int homeTeamScore;
  final int awayTeamScore;
  final int? firstToServe;
  bool isSelected = false;

  Event({
    required this.homeTeamName,
    required this.awayTeamName,
    required this.tournamentName,
    required this.information,
    required this.homeTeamScore,
    required this.awayTeamScore,
    required this.firstToServe,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        tournamentName: json["tournament"]["name"],
        homeTeamName: json['homeTeam']['name'],
        awayTeamName: json['awayTeam']['name'],
        information: json['status']['description'],
        homeTeamScore: json['homeScore']['current'],
        awayTeamScore: json['awayScore']['current'],
        firstToServe: json['firstToServe']);
  }
}

Future<List<Event>> fetchEvents(String? sportsDisciple) async {
  final response = await http.get(
    Uri.parse(
      'https://sofascores.p.rapidapi.com/v1/events/schedule/live?sport_id=$sportsDisciple',
    ),
    headers: {
      'X-RapidAPI-Host': 'sofascores.p.rapidapi.com',
      'X-RapidAPI-Key': 'YOUR API KEY',
    },
  );

  if (response.statusCode == 200) {
    // If the call was successful, parse the JSON
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    List<dynamic> events = jsonResponse['data'];

    return events.map((event) => Event.fromJson(event)).toList();
  } else {
    // If the call was not successful, throw an error

    throw Exception('Failed to load events');
  }
}
