import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/pages/settingpage.dart';
import 'package:flutter/material.dart';

class mydrawer extends StatelessWidget {
  const mydrawer({super.key});
  void logout(){
  final _auth=AuthService();
  _auth.SignOut();
}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                child: Icon(Icons.message,
                color: Theme.of(context).colorScheme.primary,
                size:40,
                ), 
              )),
           
          Padding(
            padding: const EdgeInsets.only(left:25.0),
            child: ListTile(
              title: Text('H O M E'),
              leading: Icon(Icons.home),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            
          ),
          Padding(
            padding: const EdgeInsets.only(left:25.0),
            child: ListTile(
              title: Text('S E T T I N G S'),
              leading: Icon(Icons.settings),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Settingspage(),));
              },
            ),
          ),
           ],
          ),
           Padding(
            padding: const EdgeInsets.only(left:25.0),
            child: ListTile(
              title: Text('L O G O U T'),
              leading: Icon(Icons.logout),
              onTap: logout,
            ),
           )
          
        ],
      ),
    );
  }
}