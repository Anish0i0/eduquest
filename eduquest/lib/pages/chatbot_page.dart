import 'package:flutter/material.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final ScrollController _scrollController = ScrollController();

  // Enhanced knowledge base (Q&A about human body)
  final Map<String, String> _knowledgeBase = {
    "what is the largest organ": "The skin is the largest organ in the human body.",
    "how many bones": "An adult human body has 206 bones.",
    "body temperature": "The average normal body temperature is about 98.6°F (37°C).",
    "strongest muscle": "The masseter (jaw muscle) is the strongest muscle in the human body.",
    "how many teeth": "Adults usually have 32 teeth, including wisdom teeth.",
    "heart function": "The heart pumps blood throughout the body, delivering oxygen and nutrients.",
    "respiratory system": "The respiratory system includes the lungs and airways, helping us breathe.",
    "nervous system": "The nervous system controls both voluntary and involuntary actions.",
    "digestive system": "The digestive system breaks down food and absorbs nutrients.",
    "skeletal system": "The skeletal system provides structure and protects internal organs.",
    "hello": "Hello! I'm here to help you learn about the human body. What would you like to know?",
    "hi": "Hi there! Ask me anything about the human body.",
    "help": "I can answer questions about human anatomy, organs, systems, and more. Try asking about bones, muscles, or organs!",
  };

  void _sendMessage() {
    String userMsg = _controller.text.trim();
    if (userMsg.isEmpty) return;

    setState(() {
      _messages.add({"role": "user", "text": userMsg});
    });

    _controller.clear();

    // Scroll to bottom when new message is added
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });

    // Find the best matching response
    String reply = "I'm not sure about that yet. Try asking about human anatomy, organs, or body systems!";
    String lowerMsg = userMsg.toLowerCase();

    // Check for exact matches first
    bool foundMatch = false;
    _knowledgeBase.forEach((key, value) {
      if (lowerMsg.contains(key)) {
        reply = value;
        foundMatch = true;
      }
    });

    // If no match found, provide a generic response
    if (!foundMatch) {
      if (lowerMsg.contains("thank you")) {
        reply = "You're welcome! Is there anything else you'd like to know about the human body?";
      } else if (lowerMsg.contains("how are you")) {
        reply = "I'm doing great! Ready to help you learn about the amazing human body.";
      }
    }

    // Simulate typing delay
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        _messages.add({"role": "bot", "text": reply});
      });
      
      // Scroll to bottom after bot replies
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "EduQuest Assistant",
          style: TextStyle(
            fontFamily: "NotoSans",
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
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
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];
                  final isUser = msg["role"] == "user";
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: isUser
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (!isUser)
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.school,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        if (!isUser) const SizedBox(width: 8),
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isUser
                                  ? Colors.blue.shade900
                                  : Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(16),
                                topRight: const Radius.circular(16),
                                bottomLeft: isUser
                                    ? const Radius.circular(16)
                                    : const Radius.circular(4),
                                bottomRight: isUser
                                    ? const Radius.circular(4)
                                    : const Radius.circular(16),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              msg["text"] ?? "",
                              style: TextStyle(
                                fontFamily: "NotoSans",
                                color: isUser
                                    ? Colors.white
                                    : Colors.blue.shade900,
                              ),
                            ),
                          ),
                        ),
                        if (isUser) const SizedBox(width: 8),
                        if (isUser)
                          Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: "Ask about human body...",
                          hintStyle: TextStyle(
                            fontFamily: "NotoSans",
                            color: Colors.grey.shade600,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                        ),
                        onSubmitted: (value) => _sendMessage(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}