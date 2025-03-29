import 'package:eduquest/pages/dashboard.dart';
import 'package:eduquest/pages/lesson1.dart';
import 'package:flutter/material.dart';

class SubjectSelector extends StatefulWidget {
  const SubjectSelector({super.key});

  @override
  State<SubjectSelector> createState() => _SubjectSelectorState();
}

class _SubjectSelectorState extends State<SubjectSelector> {
  final List<Map<String, String>> subjects = [
    {"title": "Biology", "imagePath": "assets/images/subjects/biology.jpg"},
    {"title": "Math", "imagePath": "assets/images/subjects/math.jpg"},
    {"title": "History", "imagePath": "assets/images/subjects/history.jpg"},
    {"title": "Geography", "imagePath": "assets/images/subjects/geography.jpg"},
    {"title": "Science", "imagePath": "assets/images/subjects/science.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Select Your Subject',
          style: TextStyle(fontFamily: "NotoSans"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns per row
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.9, // Controls height-to-width ratio
          ),
          itemCount: subjects.length + 1, // Extra item for "More" button
          itemBuilder: (context, index) {
            if (index < subjects.length) {
              return _buildSubjectOption(
                title: subjects[index]["title"]!,
                imagePath: subjects[index]["imagePath"]!,
              );
            } else {
              return _buildMoreButton();
            }
          },
        ),
      ),
    );
  }

  Widget _buildSubjectOption({
    required String title,
    required String imagePath,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 6,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.cover),
              SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "NotoSans",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoreButton() {
    return Card(
      color: Colors.white,
      elevation: 6,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: GestureDetector(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.more_horiz, size: 50, color: Colors.black54),
              SizedBox(height: 8),
              Text(
                "More",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "NotoSans",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
