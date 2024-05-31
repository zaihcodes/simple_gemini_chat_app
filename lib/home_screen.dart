import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gemini_gpt/models/message.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [
    Message(text: "Hi", isUser: true),
    Message(text: "Hello, How are you ?", isUser: false),
    Message(text: "I'm good, how about you", isUser: true),
    Message(text: "I'm excellent", isUser: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.bolt),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Gemini gpt'),
                ],
              ),
              Icon(Icons.voice_chat)
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return ListTile(
                    title: Align(
                      alignment: message.isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: message.isUser
                              ? Colors.greenAccent
                              : Colors.grey.shade400,
                          borderRadius: BorderRadius.only(
                              topLeft: message.isUser
                                  ? const Radius.circular(20)
                                  : const Radius.circular(00),
                              topRight: message.isUser
                                  ? const Radius.circular(0)
                                  : const Radius.circular(20),
                              bottomLeft: const Radius.circular(20),
                              bottomRight: const Radius.circular(20)),
                        ),
                        child: Text(
                          message.text,
                          style: TextStyle(
                            color: message.isUser ? Colors.black : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 32, left: 16, right: 16, top: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Enter your message',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.send,
                      color: Colors.greenAccent,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
