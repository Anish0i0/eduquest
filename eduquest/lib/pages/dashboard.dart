import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:eduquest/pages/lesson1.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  int userScore = 1250; // User's current score

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        elevation: 0,
        title: Text(
          _selectedIndex == 0 ? "Lessons" : "Progress",
          style: const TextStyle(
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
              child: Text(
                "U",
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
        child: _selectedIndex == 0 ? _buildLessonsTab() : _buildProgressTab(),
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
          const BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Lessons",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: "Progress",
          ),
        ],
      ),
    );
  }

  Widget _buildLessonsTab() {
    return Column(
      children: [
        _buildStreakCard(),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Continue Learning",
              style: TextStyle(
                fontFamily: "NotoSans",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        _buildCurrentLessonCard(),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "All Lessons",
              style: TextStyle(
                fontFamily: "NotoSans",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: _buildLessonList(),
        ),
      ],
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
          const Icon(
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
          CircularPercentIndicator(
            radius: 30.0,
            lineWidth: 5.0,
            percent: 0.7,
            center: const Text(
              "7",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            progressColor: Colors.orangeAccent,
          ),
        ],
      ),
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
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.science,
              color: Colors.blue.shade800,
              size: 40,
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
            icon: Icon(
              Icons.play_circle_fill,
              color: Colors.blue.shade900,
              size: 36,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BiologyLesson(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLessonList() {
    final lessons = [
      {"title": "Animals", "progress": 0.2, "icon": Icons.pets},
      {"title": "Plants", "progress": 0.0, "icon": Icons.spa},
      {"title": "Weather", "progress": 0.8, "icon": Icons.wb_sunny},
      {"title": "Physics", "progress": 0.5, "icon": Icons.science},
      {"title": "Chemistry", "progress": 0.3, "icon": Icons.thermostat},
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
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  lesson["icon"] as IconData,
                  color: Colors.blue.shade800,
                  size: 30,
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
                icon: Icon(
                  Icons.play_circle_outline,
                  color: Colors.blue.shade700,
                ),
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

  Widget _buildProgressTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildUserRankCard(),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Leaderboard",
                style: TextStyle(
                  fontFamily: "NotoSans",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _buildLeaderboard(),
          const SizedBox(height: 16),
          _buildAchievements(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildUserRankCard() {
    String rank = _getRank(userScore);
    Color rankColor = _getRankColor(rank);
    IconData rankIcon = _getRankIcon(rank);
    
    return Container(
      margin: const EdgeInsets.all(16),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Rank",
                    style: TextStyle(
                      fontFamily: "NotoSans",
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(rankIcon, color: rankColor, size: 28),
                      const SizedBox(width: 8),
                      Text(
                        rank,
                        style: TextStyle(
                          fontFamily: "NotoSans",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: rankColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Total Points",
                    style: TextStyle(
                      fontFamily: "NotoSans",
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "$userScore pts",
                    style: TextStyle(
                      fontFamily: "NotoSans",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: _getProgressToNextRank(userScore),
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(rankColor),
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 8),
          Text(
            "${((_getProgressToNextRank(userScore)) * 100).toStringAsFixed(0)}% to next rank",
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

  String _getRank(int score) {
    if (score >= 2000) return "Diamond";
    if (score >= 1500) return "Platinum";
    if (score >= 1000) return "Gold";
    if (score >= 500) return "Silver";
    return "Bronze";
  }

  Color _getRankColor(String rank) {
    switch (rank) {
      case "Diamond":
        return Colors.cyan;
      case "Platinum":
        return Colors.grey.shade400;
      case "Gold":
        return Colors.amber;
      case "Silver":
        return Colors.grey.shade300;
      case "Bronze":
        return Colors.orange.shade700;
      default:
        return Colors.blue;
    }
  }

  IconData _getRankIcon(String rank) {
    switch (rank) {
      case "Diamond":
        return Icons.diamond;
      case "Platinum":
        return Icons.star;
      case "Gold":
        return Icons.emoji_events;
      case "Silver":
        return Icons.workspace_premium;
      case "Bronze":
        return Icons.military_tech;
      default:
        return Icons.star;
    }
  }

  double _getProgressToNextRank(int score) {
    if (score >= 2000) return 1.0;
    if (score >= 1500) return (score - 1500) / 500;
    if (score >= 1000) return (score - 1000) / 500;
    if (score >= 500) return (score - 500) / 500;
    return score / 500;
  }

  Widget _buildLeaderboard() {
    final friends = [
      {"name": "You", "score": 1250, "rank": 4, "isCurrentUser": true},
      {"name": "Sarah", "score": 1800, "rank": 1, "isCurrentUser": false},
      {"name": "John", "score": 1650, "rank": 2, "isCurrentUser": false},
      {"name": "Mike", "score": 1420, "rank": 3, "isCurrentUser": false},
      {"name": "Emma", "score": 1100, "rank": 5, "isCurrentUser": false},
      {"name": "Alex", "score": 950, "rank": 6, "isCurrentUser": false},
      {"name": "Lisa", "score": 800, "rank": 7, "isCurrentUser": false},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: friends.length,
        itemBuilder: (context, index) {
          final friend = friends[index];
          String rank = _getRank(friend["score"] as int);
          Color rankColor = _getRankColor(rank);
          
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: friend["isCurrentUser"] as bool
                  ? Colors.blue.shade100
                  : Colors.white,
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
                Text(
                  "${friend["rank"]}",
                  style: TextStyle(
                    fontFamily: "NotoSans",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
                const SizedBox(width: 16),
                CircleAvatar(
                  backgroundColor: Colors.blue.shade200,
                  child: Text(
                    friend["name"].toString().substring(0, 1),
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        friend["name"] as String,
                        style: TextStyle(
                          fontFamily: "NotoSans",
                          fontSize: 16,
                          fontWeight: friend["isCurrentUser"] as bool
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      if (friend["isCurrentUser"] as bool)
                        Text(
                          rank,
                          style: TextStyle(
                            fontFamily: "NotoSans",
                            fontSize: 12,
                            color: rankColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
                Text(
                  "${friend["score"]} pts",
                  style: TextStyle(
                    fontFamily: "NotoSans",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildAchievements() {
    final achievements = [
      {
        "title": "Quick Learner",
        "description": "Complete 5 lessons in a week",
        "icon": Icons.flash_on,
        "color": Colors.amber,
        "completed": true,
      },
      {
        "title": "Quiz Master",
        "description": "Score 100% on 3 quizzes",
        "icon": Icons.quiz,
        "color": Colors.purple,
        "completed": true,
      },
      {
        "title": "Streak Builder",
        "description": "Maintain a 7-day streak",
        "icon": Icons.local_fire_department,
        "color": Colors.orange,
        "completed": true,
      },
      {
        "title": "Explorer",
        "description": "Complete all lessons in a category",
        "icon": Icons.explore,
        "color": Colors.green,
        "completed": false,
      },
      {
        "title": "Perfectionist",
        "description": "Get 100% on all quizzes",
        "icon": Icons.star,
        "color": Colors.blue,
        "completed": false,
      },
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Achievements",
            style: TextStyle(
              fontFamily: "NotoSans",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: achievements.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final achievement = achievements[index];
              return ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: achievement["color"] as Color,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    achievement["icon"] as IconData,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                title: Text(
                  achievement["title"] as String,
                  style: const TextStyle(
                    fontFamily: "NotoSans",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  achievement["description"] as String,
                  style: TextStyle(
                    fontFamily: "NotoSans",
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                trailing: achievement["completed"] as bool
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : const Icon(Icons.lock, color: Colors.grey),
              );
            },
          ),
        ],
      ),
    );
  }
}