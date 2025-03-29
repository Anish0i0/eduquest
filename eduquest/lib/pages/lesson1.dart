import 'package:flutter/material.dart';

class BiologyLesson extends StatefulWidget {
  const BiologyLesson({super.key});

  @override
  State<BiologyLesson> createState() => _BiologyLessonState();
}

class _BiologyLessonState extends State<BiologyLesson> {
  final String lessonSubject = "Human Anatomy";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          lessonSubject,
          style: const TextStyle(fontFamily: "NotoSans"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Rounded Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          16,
                        ), // Rounded corners
                        child: Image.asset("assets/images/biologylesson.png"),
                      ),
                      const SizedBox(height: 16),

                      // Text Content
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: "NotoSans",
                            color: Colors.black87,
                          ),
                          children: [
                            const TextSpan(
                              text:
                                  "The human body is like a super cool robot 🤖 made up of different parts that work together! Let’s explore some of them:\n\n",
                            ),
                            _boldText("❤️ Heart: "),
                            const TextSpan(
                              text:
                                  "Your heart is like a powerful pump that pushes blood all around your body, giving you energy to play, run, and jump! It never takes a break, even when you're sleeping! 💤💖\n\n",
                            ),
                            _boldText("🧠 Brain: "),
                            const TextSpan(
                              text:
                                  "Your brain is the boss of your body! It helps you think, learn, and even remember your favorite games! 🎮✨ It also sends messages to your hands, legs, and eyes super fast—like a superhero! 🦸‍♂️💡\n\n",
                            ),
                            _boldText("🦵 Legs & Feet: "),
                            const TextSpan(
                              text:
                                  "Your legs help you run, jump, and dance! 🏃‍♂️💃 Without them, you couldn’t play tag or kick a ball! ⚽\n\n",
                            ),
                            _boldText("✋ Hands & Fingers: "),
                            const TextSpan(
                              text:
                                  "These are your little helpers! 🖐️ They let you draw 🎨, eat yummy food 🍎, and even give high-fives! ✋😃\n\n",
                            ),
                            _boldText("🫁 Lungs: "),
                            const TextSpan(
                              text:
                                  "These are like big balloons inside your chest! 🎈 They help you breathe in fresh air and blow out the old air. Try taking a deep breath—your lungs are working hard! 😮💨\n\n",
                            ),
                            _boldText("👀 Eyes: "),
                            const TextSpan(
                              text:
                                  "Your eyes are like little cameras 📸 that help you see the world! Without them, you wouldn’t see colors 🌈, shapes, or even your best friend’s smile! 😊\n\n",
                            ),
                            _boldText("👂 Ears: "),
                            const TextSpan(
                              text:
                                  "Your ears help you hear music, voices, and even whispers! 🎵👂 They also help you stay balanced so you don’t fall when you spin around! 🤸‍♂️\n\n",
                            ),
                            const TextSpan(
                              text:
                                  "Your body is amazing because all these parts work together like a team 🏆! Take care of them by eating healthy food 🥦, drinking water 💧, and getting plenty of sleep! 😴✨",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildButtonRow(),
            const SizedBox(height: 16),
            _buildARButton(),
          ],
        ),
      ),
    );
  }

  /// Helper function to bold specific text
  TextSpan _boldText(String text) {
    return TextSpan(
      text: text,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  /// Creates the "Ask Doubt" and "Quiz" buttons
  Widget _buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: _buildOutlinedButton("Ask Doubt", () {})),
        const SizedBox(width: 16),
        Expanded(child: _buildOutlinedButton("Quiz", () {})),
      ],
    );
  }

  /// Creates an outlined button with a blue border
  Widget _buildOutlinedButton(String text, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.blue.shade900, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontFamily: "NotoSans",
          color: Colors.blue.shade900,
        ),
      ),
    );
  }

  /// Creates the "Open AR View" button
  Widget _buildARButton() {
    return SizedBox(
      width: double.infinity, // Full-width AR button
      height: 75,
      child: ElevatedButton(
        onPressed: () {
          // TODO: Open AR View
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.view_in_ar, color: Colors.white, size: 30),
            const SizedBox(width: 10),
            const Text(
              "Open AR View",
              style: TextStyle(
                fontSize: 22,
                fontFamily: "NotoSans",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
