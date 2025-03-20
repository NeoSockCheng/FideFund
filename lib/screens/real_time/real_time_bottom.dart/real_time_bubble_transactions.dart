import 'dart:async';

import 'package:flutter/material.dart';

class RealTimeBubbleTransactions extends StatefulWidget {
  const RealTimeBubbleTransactions({super.key});

  @override
  _RealTimeBubbleTransactionsState createState() => _RealTimeBubbleTransactionsState();
}

class _RealTimeBubbleTransactionsState extends State<RealTimeBubbleTransactions> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final List<String> _messages = [];
  int _messageCount = 1;

  @override
  void initState() {
    super.initState();
    _startAddingMessages();
  }

  void _startAddingMessages() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      _addNewMessage("New message $_messageCount");
      _messageCount++;
    });
  }

  void _addNewMessage(String message) {
    _messages.insert(0, message);
    _listKey.currentState?.insertItem(0, duration: const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Message Pop-up")),
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5)],
          ),
          child: AnimatedList(
            key: _listKey,
            reverse: true, // Ensures new messages appear at the top
            initialItemCount: _messages.length,
            itemBuilder: (context, index, animation) {
              return _buildMessageItem(_messages[index], animation);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMessageItem(String message, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}