import 'package:firebase_login/firebase%20service/auth.dart';
import 'package:flutter/material.dart';

import 'otp_screen.dart';




class InputNumber extends StatelessWidget {
   InputNumber({super.key});
  final TextEditingController _controllerNumber=TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               const Text("Enter Your Mobile Number",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                TextField(
                   autofocus: true,
                  keyboardType: TextInputType.number,
                  controller: _controllerNumber,
                  decoration: InputDecoration(
                    
                    hintText: "ENTER NUMBER ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.orange
                      )
                    )
                  ),
                ),
               const SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Auth().veryfyPhoneNumber("+91${_controllerNumber.text}");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen(),));

                }, child: const Text("Submit"))
                
            ],
            
          ),
        ) ,
      ),
    );
  }
}

