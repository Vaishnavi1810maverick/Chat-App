import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
User loggedUser;

class ChatScreen extends StatefulWidget {
  static const String chatId = "chat_screen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final textController = TextEditingController();
  String msg;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              //Implement logout functionality
              _auth.signOut();
              Navigator.pop(context);
            },
            child: Text(
              'SignOut',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
        title: Center(
          child: Text(
            'Chat Drop',
          ),
        ),
        backgroundColor: Colors.pink,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: textController,
                      onChanged: (value) {
                        //Do something with the user input.
                        msg = value;
                      },
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      textController.clear();
                      //Implement send functionality.
                      _firestore.collection('Messages').add(
                        {
                          'Message': msg,
                          'Sender': loggedUser.email,
                          'time': FieldValue.serverTimestamp()
                        },
                      );
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
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

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('Messages')
          .orderBy('time', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        List<MessageBubble> messageBubbles = [];
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 4.0,
              backgroundColor: Colors.blueAccent,
            ),
          );
        }
        if (snapshot.data.docs.length > 0) {
          final messages = snapshot.data.docs.reversed;
          for (var message in messages) {
            final messageText = message.data()['Message'];
            final messageSender = message.data()['Sender'];
            final messageTime = message.data()['time'] as Timestamp;
            final currentUser = loggedUser.email;

            final messageBubble = MessageBubble(messageText, messageSender,
                currentUser == messageSender, messageTime);

            messageBubbles.add(messageBubble);
          }
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble(this.text, this.sender, this.isMe, this.time);
  final String text, sender;
  final bool isMe;
  final Timestamp time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              ' $sender [${DateTime.fromMillisecondsSinceEpoch(time.seconds * 1000)}]', // add this only if you want to show the time along with the email. If you dont want this then don't add this DateTime thing
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
          Container(
            child: Material(
              borderRadius: isMe
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    )
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
              elevation: 5.0,
              color: isMe ? Colors.blue[700] : Colors.pink[700],
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
