import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String senderId;
  final String receiverId;

  ChatPage({required this.senderId, required this.receiverId});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final int _messageLimit = 10;
  List<DocumentSnapshot> _messages = [];
  bool _loadingMore = false;

  @override
  void initState() {
    super.initState();
    _loadMessages();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _loadMoreMessages();
    }
  }

  Future<void> _loadMessages() async {
    final senderQuerySnapshot = await FirebaseFirestore.instance
        .collection('message')
        .doc(widget.senderId)
        .collection(widget.receiverId)
        .orderBy('time', descending: true)
        .limit(_messageLimit)
        .get();
    final receiverQuerySnapshot = await FirebaseFirestore.instance
        .collection('message')
        .doc(widget.receiverId)
        .collection(widget.senderId)
        .orderBy('time', descending: true)
        .limit(_messageLimit)
        .get();
    final senderMessages = senderQuerySnapshot.docs;
    final receiverMessages = receiverQuerySnapshot.docs;
    final allMessages = [...senderMessages, ...receiverMessages];
    allMessages.sort((a, b) => b['time'].compareTo(a['time']));
    setState(() {
      _messages = allMessages;
    });
  }

  Future<void> _loadMoreMessages() async {
    if (!_loadingMore) {
      setState(() {
        _loadingMore = true;
      });
      final lastMessage = _messages.last;
      final senderQuerySnapshot = await FirebaseFirestore.instance
          .collection('message')
          .doc(widget.senderId)
          .collection(widget.receiverId)
          .orderBy('time', descending: true)
          .startAfterDocument(lastMessage)
          .limit(_messageLimit)
          .get();
      final receiverQuerySnapshot = await FirebaseFirestore.instance
          .collection('message')
          .doc(widget.receiverId)
          .collection(widget.senderId)
          .orderBy('time', descending: true)
          .startAfterDocument(lastMessage)
          .limit(_messageLimit)
          .get();
      final senderMessages = senderQuerySnapshot.docs;
      final receiverMessages = receiverQuerySnapshot.docs;
      final allMessages = [
        ..._messages,
        ...senderMessages,
        ...receiverMessages
      ];
      allMessages.sort((a, b) => b['time'].compareTo(a['time']));
      setState(() {
        _messages = allMessages;
        _loadingMore = false;
      });
    }
  }

  Widget _buildMessage(DocumentSnapshot message) {
    final isSender = message.id == widget.senderId;
    return ListTile(
      title: Text(message['text']),
      subtitle: Text(
        '${message['time'].toDate().hour}:${message['time'].toDate().minute}',
      ),
      leading: isSender
          ? null
          : CircleAvatar(
              child: Text(widget.receiverId),
            ),
      trailing: isSender
          ? CircleAvatar(
              child: Text(widget.senderId),
            )
          : null,
    );
  }

  Future<void> _sendMessage() async {
    final String text = _textController.text.trim();
    if (text.isEmpty) return;
    final DateTime now = DateTime.now();
    final Map<String, dynamic> data = {
      'text': text,
      'sender': widget.senderId,
      'receiver': widget.receiverId,
      'time': now,
    };
    await FirebaseFirestore.instance
        .collection('messages')
        .doc(widget.senderId)
        .collection(widget.receiverId)
        .add(data);
    await FirebaseFirestore.instance
        .collection('messages')
        .doc(widget.receiverId)
        .collection(widget.senderId)
        .add(data);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.receiverId}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                if (index == _messages.length - 1 && _loadingMore) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return _buildMessage(_messages[index]);
                }
              },
            ),
          ),
          if (_messages.isNotEmpty)
            Container(
              height: 50,
              child: Divider(),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _sendMessage();
                  },
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
