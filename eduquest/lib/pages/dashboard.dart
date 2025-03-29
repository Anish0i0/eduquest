import 'package:eduquest/pages/lesson1.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Dashboard",
          style: TextStyle(
            fontFamily: "NotoSans",
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/avatar.png"),
              radius: 18,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildStreakCard(),
          Expanded(
            child: _selectedIndex == 0 ? _buildLessons() : _buildAnalytics(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 26,
        selectedLabelStyle: TextStyle(
          color: Colors.blue.shade900,
          fontFamily: "NotoSans",
          fontSize: 16,
        ),
        unselectedLabelStyle: TextStyle(fontFamily: "NotoSans", fontSize: 16),
        selectedItemColor: Colors.blue.shade900,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Lessons"),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Analytics",
          ),
        ],
      ),
    );
  }

  Widget _buildStreakCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.local_fire_department,
                color: Colors.orangeAccent,
                size: 36,
              ),
              const SizedBox(width: 10),
              const Text(
                "Streak: 7 Days",
                style: TextStyle(
                  fontFamily: "NotoSans",
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLessons() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("Current Lesson"),
          _buildCurrentLessonCard(
            "Human Body",
            "assets/images/biologylesson.png",
            0.35,
          ),

          const SizedBox(height: 20),
          _buildSectionTitle("All Lessons"),
          _buildLessonSlider(),
        ],
      ),
    );
  }

  Widget _buildAnalytics() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("Ranking System"),
          const SizedBox(height: 10),
          Center(child: _buildRankingCard(0.75, "Gold", "Platinum")),
          const SizedBox(height: 20),
          _buildSectionTitle("Leaderboard"),
          const SizedBox(height: 10),
          _buildLeaderboard(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: "NotoSans",
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLessonSlider() {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildLessonCard("Human Body", "assets/images/biologylesson.png"),
          _buildLessonCard("Animals", "assets/images/animals.png"),
          _buildMoreCard(),
        ],
      ),
    );
  }

  Widget _buildLessonCard(String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BiologyLesson()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 200,
            color: Colors.blue.shade100.withAlpha(100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontFamily: "NotoSans",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMoreCard() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 200,
          color: Colors.grey.shade200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.more_horiz_rounded, size: 32, color: Colors.black54),
              Text(
                "More",
                style: TextStyle(
                  fontFamily: "NotoSans",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentLessonCard(
    String title,
    String imagePath,
    double progress,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BiologyLesson()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 200,
            color: Colors.blue.shade100.withAlpha(100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontFamily: "NotoSans",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      LinearPercentIndicator(
                        width: 180,
                        lineHeight: 8.0,
                        percent: progress,
                        progressColor: Colors.green,
                        backgroundColor: Colors.grey.shade300,
                        barRadius: const Radius.circular(8),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${(progress * 100).toInt()}% Completed",
                        style: const TextStyle(
                          fontFamily: "NotoSans",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeaderboard() {
    List<String> names = ["Alisha", "Rohit", "Krishna", "Anish", "Manbir"];
    List<String> avatars = [
      "assets/images/avatars/alisha.png",
      "assets/images/avatar.png",
      "assets/images/avatars/krishna.png",
      "assets/images/avatars/anish.png",
      "assets/images/avatars/manbir.png",
    ];
    List<IconData> icons = [
      Icons.emoji_events,
      Icons.emoji_events,
      Icons.emoji_events,
      Icons.person,
      Icons.person,
    ];

    List<Color> iconColors = [
      Colors.amber,
      Colors.grey,
      Colors.brown,
      Colors.transparent,
      Colors.transparent,
    ];

    return Column(
      children: List.generate(names.length, (index) {
        return ListTile(
          leading: Icon(icons[index], color: iconColors[index], size: 30),
          title: Text(
            names[index],
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          trailing: CircleAvatar(backgroundImage: AssetImage(avatars[index])),
        );
      }),
    );
  }

  Widget _buildRankingCard(double progress, String rank, String nextRank) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularPercentIndicator(
          radius: 70.0,
          lineWidth: 12.0,
          percent: progress,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                rank,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${(progress * 100).toInt()}%",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          progressColor: Colors.orange.shade800,
          backgroundColor: Colors.grey.shade300,
          circularStrokeCap: CircularStrokeCap.round,
          animation: true,
        ),
        const SizedBox(height: 8),
        Text(
          "You are 3 days away \nfrom $nextRank rank",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
