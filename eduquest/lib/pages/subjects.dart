import 'package:eduquest/pages/dashboard.dart';
import 'package:eduquest/pages/lesson1.dart';
import 'package:flutter/material.dart';

class SubjectSelector extends StatefulWidget {
  const SubjectSelector({super.key});

  @override
  State<SubjectSelector> createState() => _SubjectSelectorState();
}

class _SubjectSelectorState extends State<SubjectSelector> {
  final List<Map<String, dynamic>> subjects = [
    {
      "title": "Biology",
      "imagePath": "assets/images/subjects/biology.jpg",
      "color": Colors.green.shade100,
      "accentColor": Colors.green.shade700
    },
    {
      "title": "Math",
      "imagePath": "assets/images/subjects/math.jpg",
      "color": Colors.blue.shade100,
      "accentColor": Colors.blue.shade700
    },
    {
      "title": "History",
      "imagePath": "assets/images/subjects/history.jpg",
      "color": Colors.orange.shade100,
      "accentColor": Colors.orange.shade700
    },
    {
      "title": "Geography",
      "imagePath": "assets/images/subjects/geography.jpg",
      "color": Colors.purple.shade100,
      "accentColor": Colors.purple.shade700
    },
    {
      "title": "Science",
      "imagePath": "assets/images/subjects/science.jpg",
      "color": Colors.red.shade100,
      "accentColor": Colors.red.shade700
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        elevation: 0,
        title: const Text(
          'Select Your Subject',
          style: TextStyle(
            fontFamily: "NotoSans",
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.blue.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: Text(
                  "Choose a subject to continue learning",
                  style: TextStyle(
                    fontFamily: "NotoSans",
                    fontSize: 16,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: subjects.length + 1,
                  itemBuilder: (context, index) {
                    if (index < subjects.length) {
                      final subject = subjects[index];
                      return _buildSubjectOption(
                        title: subject["title"] as String? ?? "Unknown",
                        imagePath: subject["imagePath"] as String? ?? "",
                        cardColor: subject["color"] as Color? ?? Colors.grey.shade100,
                        accentColor: subject["accentColor"] as Color? ?? Colors.grey,
                      );
                    } else {
                      return _buildMoreButton();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubjectOption({
    required String title,
    required String imagePath,
    required Color cardColor,
    required Color accentColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Dashboard()),
            );
          },
          borderRadius: BorderRadius.circular(20),
          splashColor: accentColor.withOpacity(0.2),
          highlightColor: accentColor.withOpacity(0.1),
          child: Container(
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [cardColor, _lightenColor(cardColor)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -10,
                  bottom: -10,
                  child: Opacity(
                    opacity: 0.05,
                    child: Icon(
                      Icons.menu_book,
                      size: 80,
                      color: accentColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: accentColor.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: imagePath.isNotEmpty
                              ? Image.asset(
                                  imagePath,
                                  fit: BoxFit.contain,
                                )
                              : Icon(
                                  Icons.subject,
                                  color: accentColor,
                                  size: 30,
                                ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.blueGrey.shade800,
                          fontFamily: "NotoSans",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: accentColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Begin learning",
                          style: TextStyle(
                            fontFamily: "NotoSans",
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: accentColor,
                          ),
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

  Widget _buildMoreButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Handle more button tap
          },
          borderRadius: BorderRadius.circular(20),
          splashColor: Colors.blue.withOpacity(0.2),
          highlightColor: Colors.blue.withOpacity(0.1),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  Colors.grey.shade100,
                  Colors.grey.shade50,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -10,
                  bottom: -10,
                  child: Opacity(
                    opacity: 0.05,
                    child: Icon(
                      Icons.add_circle_outline,
                      size: 80,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.more_horiz,
                          size: 36,
                          color: Colors.blue.shade700,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "More Subjects",
                        style: TextStyle(
                          color: Colors.blueGrey.shade800,
                          fontFamily: "NotoSans",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Coming soon",
                          style: TextStyle(
                            fontFamily: "NotoSans",
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue.shade700,
                          ),
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

  Color _lightenColor(Color color) {
    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness((hsl.lightness + 0.3).clamp(0.0, 1.0));
    return hslLight.toColor();
  }
}