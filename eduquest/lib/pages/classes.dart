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
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        elevation: 0,
        title: const Text(
          'Select Your Class',
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
                  "Choose your grade level to explore subjects",
                  style: TextStyle(
                    fontFamily: "NotoSans",
                    fontSize: 16,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    _buildClassOption(
                      context,
                      title: 'Grade 1-2',
                      imagePath: 'assets/images/grade1.png',
                      cardColor: Colors.pink.shade100,
                      accentColor: Colors.pink.shade300,
                    ),
                    const SizedBox(height: 20),
                    _buildClassOption(
                      context,
                      title: 'Grade 3-4',
                      imagePath: 'assets/images/grade3.png',
                      cardColor: Colors.orange.shade100,
                      accentColor: Colors.orange.shade300,
                    ),
                    const SizedBox(height: 20),
                    _buildClassOption(
                      context,
                      title: 'Grade 5-6',
                      imagePath: 'assets/images/grade5.png',
                      cardColor: Colors.green.shade100,
                      accentColor: Colors.green.shade300,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClassOption(
    BuildContext context, {
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
              MaterialPageRoute(builder: (context) => const SubjectSelector()),
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
                colors: [cardColor, Color.lerp(cardColor, Colors.white, 0.5)!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -20,
                  bottom: -20,
                  child: Opacity(
                    opacity: 0.05,
                    child: Icon(
                      Icons.school,
                      size: 120,
                      color: accentColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                color: Colors.blueGrey.shade800,
                                fontFamily: "NotoSans",
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Explore subjects tailored for this grade level",
                              style: TextStyle(
                                fontFamily: "NotoSans",
                                fontSize: 14,
                                color: Colors.blueGrey.shade600,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: accentColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "Tap to explore",
                                style: TextStyle(
                                  fontFamily: "NotoSans",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: accentColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Hero(
                          tag: title,
                          child: Image.asset(
                            imagePath,
                            width: 100,
                            height: 100,
                            fit: BoxFit.contain,
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
}