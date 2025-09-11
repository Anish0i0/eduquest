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
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        elevation: 0,
        title: const Text(
          "Dashboard",
          style: TextStyle(
            fontFamily: "NotoSans",
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: const AssetImage("assets/images/avatar.png"),
              radius: 18,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.blue.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            _buildStreakCard(),
            _buildQuickActions(),
            Expanded(
              child: _selectedIndex == 0 ? _buildLessons() : _buildAnalytics(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 26,
        selectedLabelStyle: TextStyle(
          color: Colors.blue.shade900,
          fontFamily: "NotoSans",
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: "NotoSans",
          fontSize: 14,
        ),
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.grey.shade600,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book, 
                color: _selectedIndex == 0 ? Colors.blue.shade900 : Colors.grey.shade600),
            label: "Lessons",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart, 
                color: _selectedIndex == 1 ? Colors.blue.shade900 : Colors.grey.shade600),
            label: "Progress",
          ),
        ],
      ),
    );
  }

  Widget _buildStreakCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.local_fire_department,
            color: Colors.orangeAccent,
            size: 32,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "7-Day Streak",
                  style: TextStyle(
                    fontFamily: "NotoSans",
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Keep learning to maintain your streak!",
                  style: TextStyle(
                    fontFamily: "NotoSans",
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildActionButton(Icons.play_arrow, "Continue", Colors.green, () {
            // Navigate to continue lesson
          }),
          _buildActionButton(Icons.assignment, "Quiz", Colors.orange, () {
            // Navigate to quiz
          }),
          _buildActionButton(Icons.leaderboard, "Rank", Colors.purple, () {
            setState(() {
              _selectedIndex = 1;
            });
          }),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontFamily: "NotoSans",
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLessons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            "Continue Learning",
            style: TextStyle(
              fontFamily: "NotoSans",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _buildCurrentLessonCard(),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(
            "All Lessons",
            style: TextStyle(
              fontFamily: "NotoSans",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: _buildLessonList(),
        ),
      ],
    );
  }

  Widget _buildCurrentLessonCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/images/biologylesson.png",
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Human Body",
                  style: TextStyle(
                    fontFamily: "NotoSans",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
                const SizedBox(height: 8),
                LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  lineHeight: 6,
                  percent: 0.35,
                  progressColor: Colors.green,
                  backgroundColor: Colors.grey.shade300,
                ),
                const SizedBox(height: 4),
                Text(
                  "35% completed",
                  style: TextStyle(
                    fontFamily: "NotoSans",
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.play_circle_fill, 
                       color: Colors.blue.shade900, size: 36),
            onPressed: () {
              // Navigate to lesson
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLessonList() {
    final lessons = [
      {"title": "Animals", "progress": 0.2, "image": "assets/images/animals.png"},
      {"title": "Plants", "progress": 0.0, "image": "assets/images/plants.png"},
      {"title": "Weather", "progress": 0.8, "image": "assets/images/weather.png"},
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        final lesson = lessons[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  lesson["image"] as String,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson["title"] as String,
                      style: const TextStyle(
                        fontFamily: "NotoSans",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 4,
                      percent: lesson["progress"] as double,
                      progressColor: Colors.blue,
                      backgroundColor: Colors.grey.shade300,
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.play_circle_outline, 
                           color: Colors.blue.shade700),
                onPressed: () {
                  // Navigate to lesson
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAnalytics() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your Progress",
            style: TextStyle(
              fontFamily: "NotoSans",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildProgressOverview(),
          const SizedBox(height: 24),
          const Text(
            "Weekly Activity",
            style: TextStyle(
              fontFamily: "NotoSans",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildActivityChart(),
          const SizedBox(height: 24),
          const Text(
            "Achievements",
            style: TextStyle(
              fontFamily: "NotoSans",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildAchievements(),
        ],
      ),
    );
  }

  Widget _buildProgressOverview() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildProgressStat("75%", "Overall", Colors.blue),
          _buildProgressStat("7", "Day Streak", Colors.orange),
          _buildProgressStat("12", "Lessons", Colors.green),
        ],
      ),
    );
  }

  Widget _buildProgressStat(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontFamily: "NotoSans",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontFamily: "NotoSans",
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildActivityChart() {
    // Simplified activity chart
    return Container(
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildChartBar(40, "Mon"),
                _buildChartBar(70, "Tue"),
                _buildChartBar(100, "Wed"),
                _buildChartBar(80, "Thu"),
                _buildChartBar(60, "Fri"),
                _buildChartBar(30, "Sat"),
                _buildChartBar(20, "Sun"),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Minutes learned per day",
            style: TextStyle(
              fontFamily: "NotoSans",
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartBar(double height, String label) {
    return Column(
      children: [
        Container(
          width: 20,
          height: height,
          decoration: BoxDecoration(
            color: Colors.blue.shade400,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontFamily: "NotoSans",
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildAchievements() {
    final achievements = [
      {"icon": Icons.emoji_events, "title": "Fast Learner", "color": Colors.amber},
      {"icon": Icons.star, "title": "Quiz Master", "color": Colors.purple},
      {"icon": Icons.timer, "title": "Dedicated", "color": Colors.blue},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: achievements.map((achievement) {
          return Column(
            children: [
              Icon(
                achievement["icon"] as IconData,
                color: achievement["color"] as Color,
                size: 32,
              ),
              const SizedBox(height: 8),
              Text(
                achievement["title"] as String,
                style: const TextStyle(
                  fontFamily: "NotoSans",
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}