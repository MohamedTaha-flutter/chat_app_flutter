import 'package:chat_app/model/message_model.dart';
import 'package:chat_app/style/color.dart';
import 'package:chat_app/widget/chat_bubble_widgey.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy("CreatedAt").snapshots(includeMetadataChanges: true) ,
      builder: (context , snapshot)  {
        List<MessageModel> messagesList = [] ;
        for(int i = 0 ; i < snapshot.data!.docs.length ; i++ )
        {
          messagesList.add(
            MessageModel.fromJson(snapshot.data!.docs[i])
          );
        }
        if(snapshot.hasError)
        {
          print( snapshot.data!.docs[0]["message"]);

          return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/scholar.png",
                    height: 55,
                  ),
                  const Text(
                    "Chat",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              centerTitle: true,
              backgroundColor: mainColor,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => ChatBubbleWidget(message: messagesList[index],),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 1,
                    ),
                    itemCount: 50,
                  ),
                ),
                MessageBar(
                  onSend: (value) {
                    messages.add({
                      "message": value,
                    });
                  },
                  actions: [
                    InkWell(
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 24,
                      ),
                      onTap: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: InkWell(
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.green,
                          size: 24,
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ) ;
        }else
        {
          return  Center(child:  CircularProgressIndicator()) ;
        }
      }
    );
  }
}
