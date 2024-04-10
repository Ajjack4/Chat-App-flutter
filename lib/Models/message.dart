import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  final String senderId;
  final String senderemail;
  final String receiverID;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.message,
    required this.receiverID,
    required this.senderId,
    required this.senderemail,
    required this.timestamp,
  });

  Map<String,dynamic> toMap(){
    return{
     'senderId':senderId,
     'senderemail':senderemail,
     'receiverID':receiverID,
     'message':message,
     'timestamp':timestamp,
    };
  }
}