import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/detail_news_page.dart';
import 'package:flutter_application_1/match_statistics_page.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
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

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 55,
                    ),
                    Text(
                      "Results",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('results')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          }
                          if (!snapshot.hasData) {
                            return const Center(child: Text('No data found'));
                          }
                          final data = snapshot.data!;
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: data.docs.length,
                            itemBuilder: (context, index) {
                              final document = data.docs[index];
                              scoresTeam1 = (document["scorer_team_1"][0]);
                              scoresTeam2 = (document["scorer_team_2"][0]);
                              return Card(
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 230,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
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
                                                  document['team_1_logo'],
                                                ),
                                              ),
                                              Text(
                                                (document['team_1_name']),
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              SizedBox(
                                                height: 55,
                                                child: Text(
                                                  formatScoresTeam1(
                                                      scoresTeam1),
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                (document['league']).toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                ("FT").toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Wrap(
                                                children: [
                                                  Text(
                                                    (document['team_1_score'])
                                                        .toString(),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    ("-").toString(),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    (document['team_2_score'])
                                                        .toString(),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                  document['team_2_logo'],
                                                ),
                                              ),
                                              Text(
                                                (document['team_2_name']),
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              SizedBox(
                                                height: 55,
                                                child: Text(
                                                  formatScoresTeam2(
                                                      scoresTeam2),
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            spacing: 3.0,
                                            children: [
                                              const Icon(
                                                  Icons.calendar_today_outlined,
                                                  size: 15),
                                              Text(
                                                document['date'],
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ],
                                          ),
                                          Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            spacing: 3.0,
                                            children: [
                                              const Icon(Icons.stadium_outlined,
                                                  size: 15),
                                              Text(
                                                document['venue'],
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ],
                                          ),
                                          Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            spacing: 3.0,
                                            children: [
                                              const Icon(CupertinoIcons.person,
                                                  size: 15),
                                              Text(
                                                document['refree'],
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push<void>(
                                              context,
                                              MaterialPageRoute<void>(
                                                builder:
                                                    (BuildContext context) =>
                                                        MatchStatisticsPage(
                                                          league: document['league'].toString(),
                                                  team_1_name:
                                                      document['team_1_name']
                                                          .toString(),
                                                  team_1_logo:
                                                      document['team_1_logo']
                                                          .toString(),
                                                  team_1_score:
                                                      document['team_1_score']
                                                          .toString(),
                                                  team_2_name:
                                                      document['team_2_name']
                                                          .toString(),
                                                  team_2_logo:
                                                      document['team_2_logo']
                                                          .toString(),
                                                  team_2_score:
                                                      document['team_2_score']
                                                          .toString(),
                                                  scorer_team_1:
                                                      document["scorer_team_1"]
                                                          [0],
                                                  scorer_team_2:
                                                      document["scorer_team_2"]
                                                          [0],
                                                  date_time: document['date']
                                                      .toString(),
                                                  venue: document['venue']
                                                      .toString(),
                                                  refree: document['refree']
                                                      .toString(),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                                color:
                                                    Colors.redAccent.shade200),
                                            child: Center(
                                              child: Text(
                                                "Statistics",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                              // ListTile(
                              //   title: Text(document['refree']),
                              //   subtitle: Text(document['team_1_name']),
                              // );
                            },
                          );
                        }),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 55,
                        ),
                        Text("Upcoming Matches",
                            style: Theme.of(context).textTheme.headlineLarge),
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('upcoming_fixtures')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              }
                              if (!snapshot.hasData) {
                                return const Center(
                                    child: Text('No data found'));
                              }
                              final data = snapshot.data!;
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: data.docs.length,
                                itemBuilder: (context, index) {
                                  final document = data.docs[index];

                                  return Card(
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 135,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
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
                                                      document['team_1_logo'],
                                                    ),
                                                  ),
                                                  Text(
                                                    (document['team_1_name']),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                (document['league']).toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                      document['team_2_logo'],
                                                    ),
                                                  ),
                                                  Text(
                                                    (document['team_2_name']),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                spacing: 3.0,
                                                children: [
                                                  const Icon(
                                                      Icons
                                                          .calendar_today_outlined,
                                                      size: 15),
                                                  Text(
                                                    document['date'],
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                ],
                                              ),
                                              Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                spacing: 3.0,
                                                children: [
                                                  const Icon(
                                                      Icons.stadium_outlined,
                                                      size: 15),
                                                  Text(
                                                    document['venue'],
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                ],
                                              ),
                                              Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                spacing: 3.0,
                                                children: [
                                                  const Icon(
                                                      CupertinoIcons.person,
                                                      size: 15),
                                                  Text(
                                                    document['refree'],
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                  // ListTile(
                                  //   title: Text(document['refree']),
                                  //   subtitle: Text(document['team_1_name']),
                                  // );
                                },
                              );
                            }),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 55,
                        ),
                        Text("Trending News",
                            style: Theme.of(context).textTheme.headlineLarge),
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('news')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              }
                              if (!snapshot.hasData) {
                                return const Center(
                                    child: Text('No data found'));
                              }
                              final data = snapshot.data!;
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: data.docs.length,
                                itemBuilder: (context, index) {
                                  final document = data.docs[index];

                                  return InkWell(
                                    onTap: () {
                                      Navigator.push<void>(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              DetailNewsPage(
                                            image: document["image"],
                                            title: document["description"],
                                            author: document["author"],
                                            date_time: document["date_time"],
                                            body: document["body"],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 350,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 300,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10)),
                                                child: Image.network(
                                                  document['image'],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                document['description'],
                                                softWrap: true,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    overflow: TextOverflow.fade,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                  // ListTile(
                                  //   title: Text(document['refree']),
                                  //   subtitle: Text(document['team_1_name']),
                                  // );
                                },
                              );
                            }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
