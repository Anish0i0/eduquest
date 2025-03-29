import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:installed_apps/index.dart';

class BiologyLesson extends StatefulWidget {
  const BiologyLesson({super.key});

  @override
  State<BiologyLesson> createState() => _BiologyLessonState();
}

class _BiologyLessonState extends State<BiologyLesson> {
  final String lessonSubject = "Human Anatomy";
  bool isEnglish = true;
  bool isSpeaking = false;

  FlutterTts tts = FlutterTts();

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
        child: Stack(
          children: [
            // Scrollable Content
            Positioned.fill(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Rounded Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset("assets/images/biologylesson.png"),
                    ),
                    const SizedBox(height: 20),

                    // Lesson Text
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "NotoSans",
                          color: Colors.black87,
                        ),
                        children: [
                          TextSpan(
                            text:
                                isEnglish
                                    ? "The human body is like a super cool robot 🤖 made up of different parts that work together! Let’s explore some of them:\n\n"
                                    : "ਮਨੁੱਖੀ ਸਰੀਰ ਇੱਕ ਸੁਪਰ ਕੂਲ ਰੋਬੋਟ ਵਾਂਗ ਹੈ 🤖 ਜੋ ਵੱਖ-ਵੱਖ ਹਿੱਸਿਆਂ ਤੋਂ ਬਣਿਆ ਹੈ ਜੋ ਇਕੱਠੇ ਕੰਮ ਕਰਦੇ ਹਨ! ਆਓ ਉਨ੍ਹਾਂ ਵਿੱਚੋਂ ਕੁਝ ਦੀ ਪੜਚੋਲ ਕਰੀਏ:\n\n",
                          ),
                          _boldText(isEnglish ? "❤️ Heart: " : "❤️ ਦਿਲ: "),
                          TextSpan(
                            text:
                                isEnglish
                                    ? "Your heart is like a powerful pump that pushes blood all around your body, giving you energy to play, run, and jump! 💖\n\n"
                                    : "ਤੁਹਾਡਾ ਦਿਲ ਇੱਕ ਸ਼ਕਤੀਸ਼ਾਲੀ ਪੰਪ ਵਾਂਗ ਹੈ ਜੋ ਤੁਹਾਡੇ ਸਰੀਰ ਵਿੱਚ ਖੂਨ ਨੂੰ ਧੱਕਦਾ ਹੈ, ਜਿਸ ਨਾਲ ਤੁਹਾਨੂੰ ਖੇਡਣ, ਦੌੜਨ ਅਤੇ ਛਾਲ ਮਾਰਨ ਲਈ ਊਰਜਾ ਮਿਲਦੀ ਹੈ! 💖\n\n",
                          ),
                          _boldText(isEnglish ? "🧠 Brain: " : "🧠 ਦਿਮਾਗ: "),
                          TextSpan(
                            text:
                                isEnglish
                                    ? "Your brain is the boss of your body! It helps you think, learn, and remember your favorite games! 🎮💡\n\n"
                                    : "ਤੁਹਾਡਾ ਦਿਮਾਗ ਤੁਹਾਡੇ ਸਰੀਰ ਦਾ ਮਾਲਕ ਹੈ! ਇਹ ਤੁਹਾਨੂੰ ਸੋਚਣ, ਸਿੱਖਣ ਅਤੇ ਤੁਹਾਡੀਆਂ ਮਨਪਸੰਦ ਖੇਡਾਂ ਨੂੰ ਯਾਦ ਰੱਖਣ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ! 🎮💡\n\n",
                          ),
                          _boldText(
                            isEnglish
                                ? "🦵 Legs & Feet: "
                                : "🦵 ਲੱਤਾਂ ਅਤੇ ਪੈਰ: ",
                          ),
                          TextSpan(
                            text:
                                isEnglish
                                    ? "Your legs help you run, jump, and dance! 🏃‍♂️💃\n\n"
                                    : "ਤੁਹਾਡੀਆਂ ਲੱਤਾਂ ਤੁਹਾਨੂੰ ਦੌੜਨ, ਛਾਲ ਮਾਰਨ ਅਤੇ ਨੱਚਣ ਵਿੱਚ ਮਦਦ ਕਰਦੀਆਂ ਹਨ! 🏃‍♂️💃\n\n",
                          ),
                          _boldText(
                            isEnglish
                                ? "✋ Hands & Fingers: "
                                : "✋ ਹੱਥ ਅਤੇ ਉਂਗਲੀਆਂ: ",
                          ),
                          TextSpan(
                            text:
                                isEnglish
                                    ? "These are your little helpers! 🖐️ You use them for drawing 🎨 and eating 🍎!\n\n"
                                    : "ਇਹ ਤੁਹਾਡੇ ਛੋਟੇ ਸਹਾਇਕ ਹਨ! 🖐️ ਤੁਸੀਂ ਇਹਨਾਂ ਨੂੰ ਚਿੱਤਰਕਾਰੀ 🎨 ਅਤੇ ਖਾਣ ਲਈ ਵਰਤਦੇ ਹੋ 🍎!\n\n",
                          ),
                          _boldText(isEnglish ? "🫁 Lungs: " : "🫁 ਫੇਫੜੇ: "),
                          TextSpan(
                            text:
                                isEnglish
                                    ? "Your lungs help you breathe in fresh air! 🎈 Try taking a deep breath! 😮💨\n\n"
                                    : "ਤੁਹਾਡੇ ਫੇਫੜੇ ਤੁਹਾਨੂੰ ਤਾਜ਼ੀ ਹਵਾ ਵਿੱਚ ਸਾਹ ਲੈਣ ਵਿੱਚ ਮਦਦ ਕਰਦੇ ਹਨ! 🎈 ਡੂੰਘਾ ਸਾਹ ਲੈਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ! 😮💨\n\n",
                          ),
                          _boldText(isEnglish ? "👀 Eyes: " : "👀 ਅੱਖਾਂ: "),
                          TextSpan(
                            text:
                                isEnglish
                                    ? "Your eyes are like little cameras 📸 that help you see the world! 🌈\n\n"
                                    : "ਤੁਹਾਡੀਆਂ ਅੱਖਾਂ ਛੋਟੇ ਕੈਮਰਿਆਂ ਵਾਂਗ ਹਨ 📸 ਜੋ ਤੁਹਾਨੂੰ ਦੁਨੀਆ ਦੇਖਣ ਵਿੱਚ ਮਦਦ ਕਰਦੀਆਂ ਹਨ! 🌈\n\n",
                          ),
                          _boldText(isEnglish ? "👂 Ears: " : "👂 ਕੰਨ: "),
                          TextSpan(
                            text:
                                isEnglish
                                    ? "Your ears help you hear music 🎵 and stay balanced! 🤸‍♂️\n\n"
                                    : "ਤੁਹਾਡੇ ਕੰਨ ਤੁਹਾਨੂੰ ਸੰਗੀਤ ਸੁਣਨ ਵਿੱਚ ਮਦਦ ਕਰਦੇ ਹਨ 🎵 ਅਤੇ ਸੰਤੁਲਿਤ ਰਹਿੰਦੇ ਹਨ! 🤸‍♂️\n\n",
                          ),
                          TextSpan(
                            text:
                                isEnglish
                                    ? "Your body is amazing because all these parts work together like a team 🏆! Take care of them by eating healthy food 🥦, drinking water 💧, and getting plenty of sleep! 😴✨"
                                    : "ਤੁਹਾਡਾ ਸਰੀਰ ਬਹੁਤ ਵਧੀਆ ਹੈ ਕਿਉਂਕਿ ਇਹ ਸਾਰੇ ਅੰਗ ਇੱਕ ਟੀਮ ਵਾਂਗ ਇਕੱਠੇ ਕੰਮ ਕਰਦੇ ਹਨ 🏆! ਸਿਹਤਮੰਦ ਭੋਜਨ ਖਾ ਕੇ, ਪਾਣੀ ਪੀ ਕੇ 💧, ਅਤੇ ਭਰਪੂਰ ਨੀਂਦ ਲੈ ਕੇ ਇਨ੍ਹਾਂ ਦੀ ਦੇਖਭਾਲ ਕਰੋ! 😴✨",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildButtonRow(),
                    const SizedBox(height: 16),
                    _buildARButton(),
                  ],
                ),
              ),
            ),

            // Translate Button (Top Right)
            Positioned(
              bottom: 84,
              right: 16,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    isEnglish = !isEnglish;
                  });
                },
                backgroundColor: Colors.blue,
                child: const Icon(Icons.translate, color: Colors.white),
              ),
            ),

            // Text-to-Speech Button (Bottom Right)
            Positioned(
              bottom: 16,
              right: 16,
              child: FloatingActionButton(
                onPressed: () {
                  if (isSpeaking) {
                    tts.stop();
                    isSpeaking = false;
                  } else {
                    isSpeaking = true;
                    tts.setLanguage(isEnglish ? "en-US" : "pa-IN");
                    tts.setSpeechRate(0.4);
                    tts.speak(
                      isEnglish
                          ? "The human body is like a super cool robot made up of different parts that work together! Let’s explore some of them. Heart: Your heart is like a powerful pump that pushes blood all around your body, giving you energy to play, run, and jump! Brain: Your brain is the boss of your body! It helps you think, learn, and remember your favorite games! Legs & Feet: Your legs help you run, jump, and dance! Hands & Fingers: These are your little helpers! You use them for drawing and eating! Lungs: Your lungs help you breathe in fresh air! Try taking a deep breath! Eyes: Your eyes are like little cameras that help you see the world! Ears: Your ears help you hear music and stay balanced! Your body is amazing because all these parts work together like a team! Take care of them by eating healthy food, drinking water, and getting plenty of sleep!"
                          : "ਮਨੁੱਖੀ ਸਰੀਰ, ਇੱਕ ਸੁਪਰ ਕੂਲ ਰੋਬੋਟ ਵਾਂਗ ਹੈ. ਜੋ ਵੱਖ-ਵੱਖ ਹਿੱਸਿਆਂ ਤੋਂ ਬਣਿਆ ਹੈ, ਜੋ ਇਕੱਠੇ ਕੰਮ ਕਰਦੇ ਹਨ! ਆਓ ਉਨ੍ਹਾਂ ਵਿੱਚੋਂ ਕੁਝ ਦੀ ਪੜਚੋਲ ਕਰੀਏ। ਦਿਲ: ਤੁਹਾਡਾ ਦਿਲ ਇੱਕ ਸ਼ਕਤੀਸ਼ਾਲੀ ਪੰਪ ਵਾਂਗ ਹੈ ਜੋ ਤੁਹਾਡੇ ਸਰੀਰ ਦੇ ਆਲੇ-ਦੁਆਲੇ ਖੂਨ ਨੂੰ ਧੱਕਦਾ ਹੈ, ਤੁਹਾਨੂੰ ਖੇਡਣ, ਦੌੜਨ ਅਤੇ ਛਾਲ ਮਾਰਨ ਲਈ ਊਰਜਾ ਦਿੰਦਾ ਹੈ! ਦਿਮਾਗ: ਤੁਹਾਡਾ ਦਿਮਾਗ ਤੁਹਾਡੇ ਸਰੀਰ ਦਾ ਮਾਲਕ ਹੈ! ਇਹ ਤੁਹਾਨੂੰ ਸੋਚਣ, ਸਿੱਖਣ ਅਤੇ ਆਪਣੀਆਂ ਮਨਪਸੰਦ ਖੇਡਾਂ ਨੂੰ ਯਾਦ ਰੱਖਣ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ! ਲੱਤਾਂ ਅਤੇ ਪੈਰ: ਤੁਹਾਡੀਆਂ ਲੱਤਾਂ ਤੁਹਾਨੂੰ ਦੌੜਨ, ਛਾਲ ਮਾਰਨ ਅਤੇ ਨੱਚਣ ਵਿੱਚ ਮਦਦ ਕਰਦੀਆਂ ਹਨ! ਹੱਥ ਅਤੇ ਉਂਗਲਾਂ: ਇਹ ਤੁਹਾਡੇ ਛੋਟੇ ਸਹਾਇਕ ਹਨ! ਤੁਸੀਂ ਇਹਨਾਂ ਦੀ ਵਰਤੋਂ ਚਿੱਤਰਕਾਰੀ ਅਤੇ ਖਾਣ ਲਈ ਕਰਦੇ ਹੋ! ਫੇਫੜੇ: ਤੁਹਾਡੇ ਫੇਫੜੇ ਤੁਹਾਨੂੰ ਤਾਜ਼ੀ ਹਵਾ ਵਿੱਚ ਸਾਹ ਲੈਣ ਵਿੱਚ ਮਦਦ ਕਰਦੇ ਹਨ! ਡੂੰਘਾ ਸਾਹ ਲੈਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ! ਅੱਖਾਂ: ਤੁਹਾਡੀਆਂ ਅੱਖਾਂ ਛੋਟੇ ਕੈਮਰਿਆਂ ਵਾਂਗ ਹਨ ਜੋ ਤੁਹਾਨੂੰ ਦੁਨੀਆ ਦੇਖਣ ਵਿੱਚ ਮਦਦ ਕਰਦੀਆਂ ਹਨ! ਕੰਨ: ਤੁਹਾਡੇ ਕੰਨ ਤੁਹਾਨੂੰ ਸੰਗੀਤ ਸੁਣਨ ਅਤੇ ਸੰਤੁਲਿਤ ਰਹਿਣ ਵਿੱਚ ਮਦਦ ਕਰਦੇ ਹਨ! ਤੁਹਾਡਾ ਸਰੀਰ ਸ਼ਾਨਦਾਰ ਹੈ ਕਿਉਂਕਿ ਇਹ ਸਾਰੇ ਹਿੱਸੇ ਇੱਕ ਟੀਮ ਵਾਂਗ ਇਕੱਠੇ ਕੰਮ ਕਰਦੇ ਹਨ! ਸਿਹਤਮੰਦ ਭੋਜਨ ਖਾ ਕੇ, ਪਾਣੀ ਪੀ ਕੇ ਅਤੇ ਭਰਪੂਰ ਨੀਂਦ ਲੈ ਕੇ ਉਹਨਾਂ ਦੀ ਦੇਖਭਾਲ ਕਰੋ!",
                    );
                  }
                },
                backgroundColor: Colors.green,
                child: const Icon(Icons.volume_up, color: Colors.white),
              ),
            ),
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
        onPressed: () async {
          // TODO: Open AR View
          InstalledApps.startApp("com.therookies.eduquest");
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
