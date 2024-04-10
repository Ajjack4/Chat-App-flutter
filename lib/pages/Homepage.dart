import 'package:chatapp/Components/myDrawer.dart';
import 'package:chatapp/Components/user_tile.dart';
import 'package:chatapp/pages/chatpage.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  // final ChatService _chatService=chatservice()
final chatservice _chatService=chatservice();
final AuthService _authService=AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
        
    
      ),
      drawer: mydrawer(),
      body:_builduserlist(),
    );
  }
  Widget _builduserlist(){
  return StreamBuilder(
    
   stream: _chatService.getUserStream(),
   builder:(context,snapshot){
    if (snapshot.hasError){
      return const Text("Error");
    }
    if(snapshot.connectionState==ConnectionState.waiting){
     return Text("Loading...");
    }
    return ListView(
      children:snapshot.data!.map<Widget>((userData)=>_builduserlistItem(userData,context)).toList(),
    );
   },
    );
}
Widget _builduserlistItem(Map<String,dynamic>userData,BuildContext context){
  if(userData['email']!=_authService.getCurrentUser()!.email){
      return UserTile(
    text:userData["email"],
    onTap:(){
     Navigator.push(context,MaterialPageRoute(builder:(context)=> chatpage(receiveremail: userData["email"],receiverID:userData['uid'],)));
    },
  );
  }
  else{
    return Container();
  }
}
}
