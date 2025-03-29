import 'package:eduquest/pages/subjects.dart';
import 'package:flutter/material.dart';

class ClassSelector extends StatefulWidget {
  const ClassSelector({super.key});

  @override
  State<ClassSelector> createState() => _ClassSelectorState();
}

class _ClassSelectorState extends State<ClassSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Select Your Class',
          style: TextStyle(fontFamily: "NotoSans"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildClassOption(
              context,
              title: 'Grade 1-2',
              imagePath: 'assets/images/grade1.jpg',
            ),
            SizedBox(height: 16),
            _buildClassOption(
              context,
              title: 'Grade 3-4',
              imagePath: 'assets/images/grade3.png',
            ),
            SizedBox(height: 16),
            _buildClassOption(
              context,
              title: 'Grade 5-6',
              imagePath: 'assets/images/grade5.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClassOption(
    BuildContext context, {
    required String title,
    required String imagePath,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SubjectSelector()),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 6, // Creates an elevated effect
        shadowColor: Colors.white, // Soft shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "NotoSans",
                  fontSize: 22,
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
