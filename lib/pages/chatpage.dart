// import 'dart:html';

import 'package:chatapp/Components/chatbubble.dart';
import 'package:chatapp/Components/mytextfield.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class chatpage extends StatelessWidget {
  final String receiveremail;
  final String receiverID;
  chatpage({super.key,required this.receiveremail,required this.receiverID});
  final TextEditingController _messageController=TextEditingController();
  final chatservice _chatService=chatservice();
  final AuthService _authService=AuthService();

  void sendMessage()async{
    if(_messageController.text.isNotEmpty){
     
      // await _chatservice.sendMessage(receiverID,_messageController.text);
     await _chatService.sendMessage(receiverID,_messageController.text);
    _messageController.clear();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiveremail),
         backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
        
        ),
        body:Column(
          children: [
          Expanded(child: _buildMessageList(),
          ),
          _buildUserInput(),
          ],
        )
        
    );
  }
  Widget _buildMessageList(){
    String senderId=_authService.getCurrentUser()!.uid;
    return StreamBuilder(stream: _chatService.getMessages(receiverID, senderId), 
    builder:(context,snapshot){
     if (snapshot.hasError){
      return Text("error");
     }

     if (snapshot.connectionState==ConnectionState.waiting){
      return const Text("Loading...");
     }
     return ListView(
      children: snapshot.data!.docs.map((doc)=>_buildMessageItem(doc)).toList(),
     );
    } );
  }

  Widget _buildMessageItem(DocumentSnapshot doc){
    Map<String,dynamic>data=doc.data() as Map<String,dynamic>;
    
    bool isCurrentUser=data['senderId']==_authService.getCurrentUser()!.uid;
    var alignment =isCurrentUser?Alignment.centerRight:Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: 
        isCurrentUser? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          ChatBubble(isCurrentUser: isCurrentUser, message: data['message'])
        ],
      ),
 
      
      );
  }
  Widget _buildUserInput(){
    return Padding(
      padding: const EdgeInsets.only(bottom:50.0),
      child: Row(
        children: [
           Expanded(child: mytextfield(
            controller: _messageController,
            hintText: 'Type a message',
            obscureText: false,
           ),
          ),
      
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              shape:BoxShape.circle,
            ),
            margin: EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: sendMessage, 
              icon: Icon(Icons.arrow_upward,color: Colors.white,),))
      ],),
    );
  }
}