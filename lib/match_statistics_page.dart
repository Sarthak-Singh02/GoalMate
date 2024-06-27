// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MatchStatisticsPage extends StatelessWidget {
  MatchStatisticsPage(
      {super.key,
      required this.team_1_name,
      required this.team_1_logo,
      required this.team_1_score,
      required this.team_2_name,
      required this.team_2_logo,
      required this.team_2_score,
      required this.scorer_team_1,
      required this.scorer_team_2,
      required this.date_time,
      required this.venue,
      required this.refree,
      required this.league});
  final String team_1_name;
  final String team_1_logo;
  final String team_1_score;
  final String team_2_name;
  final String team_2_logo;
  final String team_2_score;
  final dynamic scorer_team_1;
  final dynamic scorer_team_2;
  final String date_time;
  final String venue;
  final String refree;
  final String league;
  Map<String, dynamic> scoresTeam1 = {};
  String formatScoresTeam1(Map<String, dynamic> scores) {
    String formattedText = '';
    scores.forEach((player, timings) {
      formattedText += '$player ${timings.join(', ')}\n';
    });
    return formattedText;
  }

  Map<String, dynamic> scoresTeam2 = {};
  String formatScoresTeam2(Map<String, dynamic> scores) {
    String formattedText = '';
    scores.forEach((player, timings) {
      formattedText += '$player ${timings.join(', ')}\n';
    });
    return formattedText;
  }

  Widget matchStats(BuildContext context, String team1Stats, String stats,
      String team2Stats) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: MediaQuery.of(context).size.width / 4.5,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  team1Stats,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.3,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.redAccent.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  stats,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: MediaQuery.of(context).size.width / 4.5,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  team2Stats,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    scoresTeam1 = scorer_team_1;
    scoresTeam2 = scorer_team_2;
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: Image.asset(
              "assets/gradients/Gradient3.png",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    team_1_name + " vs " + team_2_name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 190,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 70,
                                width: 70,
                                child: Image.network(
                                  team_1_logo,
                                ),
                              ),
                              Text(
                                (team_1_name),
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              SizedBox(
                                height: 55,
                                child: Text(
                                  formatScoresTeam1(scoresTeam1),
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                (league).toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ("FT").toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Wrap(
                                children: [
                                  Text(
                                    (team_1_score).toString(),
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ("-").toString(),
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    (team_2_score).toString(),
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 70,
                                width: 70,
                                child: Image.network(
                                  team_2_logo,
                                ),
                              ),
                              Text(
                                (team_2_name),
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              SizedBox(
                                height: 55,
                                child: Text(
                                  formatScoresTeam2(scoresTeam2),
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 3.0,
                            children: [
                              const Icon(Icons.calendar_today_outlined,
                                  size: 15),
                              Text(
                                date_time,
                                style: const TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 3.0,
                            children: [
                              const Icon(Icons.stadium_outlined, size: 15),
                              Text(
                                venue,
                                style: const TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 3.0,
                            children: [
                              const Icon(CupertinoIcons.person, size: 15),
                              Text(
                                refree,
                                style: const TextStyle(fontSize: 10),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "MATCH STATISTICS",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              matchStats(context, "55%", "BALL POSSESION", "45%"),
              matchStats(context, "4", "SHOTS ON TARGET", "6"),
              matchStats(context, "8", "SHOTS OFF TARGET", "7"),
              matchStats(context, "48%", "PASSING", "52%"),
              matchStats(context, "2", "CORNERS", "3"),
              matchStats(context, "2", "OFFSIDE", "0"),
              matchStats(context, "4", "FOULS", "2"),
              matchStats(context, "1", "YELLOW CARDS", "0"),
              matchStats(context, "0", "RED CARDS", "0"),
            ],
          )
        ],
      ),
    );
  }
}
