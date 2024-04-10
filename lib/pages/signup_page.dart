import 'package:chatapp/Components/mybutton.dart';
import 'package:chatapp/Components/mytextfield.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUp extends StatelessWidget {
  final TextEditingController _emailcontroller=TextEditingController();
  final TextEditingController _passwordcontroller=TextEditingController();
   final TextEditingController _confirmpasswordcontroller=TextEditingController();
   void Function()? onTap;
   
  SignUp({super.key,required this.onTap});
 void SignUp1(BuildContext context) {
    final _auth=AuthService();

   if (_passwordcontroller.text==_confirmpasswordcontroller.text){
    try{ _auth.signupwithemailpassword(_emailcontroller.text, _passwordcontroller.text);
    }catch(e){
      showDialog(
        context: context, 
        builder: (context)=>AlertDialog(
        title: Text(e.toString()),
    ));
        }
   }
   else{
    showDialog(
        context: context, 
        builder: (context)=>AlertDialog(
          title: Text("Passwords dont match"),)
        );
       
  }}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background,
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              "Create An account",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
          
            ),
            
            const SizedBox(height: 25,),
            mytextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailcontroller,

            ),
            const SizedBox(height: 10,),
            mytextfield(
              hintText: "Password",
              obscureText: true,
              controller: _passwordcontroller,
            ),
            const SizedBox(height: 10,),
            mytextfield(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmpasswordcontroller,
            ),
            const SizedBox(height: 25,),
            mybutton(
              text: "SignUp",
              onTap:() =>SignUp1(context),
            ),
            // mybutton(
            //   text: "SignUp",
            // ),
            
            const SizedBox(height: 25,),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("Already have an account? ",style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),),
            GestureDetector(
              onTap: onTap,
              child: Text("LogIn Now",style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),),
            )
            ]
           )
            
          ]
          ,),
      )
   
    );
  }

 
}