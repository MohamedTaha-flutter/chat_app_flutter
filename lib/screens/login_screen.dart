import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:chat_app/style/color.dart';
import 'package:chat_app/widget/textFormFieldWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState>  formKey = GlobalKey<FormState>() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              const Image(image: AssetImage("assets/images/scholar.png")),
              const Text(
                "Scholar Chat",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'font',
                  color: Colors.white,
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              const Row(
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldWidget(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " email should not be empty ";
                  }
                  return null;
                },
                label: const Text(
                  "Email",
                  style: TextStyle(color: Colors.white),
                ),
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldWidget(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Your Password please ";
                  }
                  return null;
                },
                label: const Text(
                  "Password",
                  style: TextStyle(color: Colors.white),
                ),
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: ()async
                  {
                    if (formKey.currentState!.validate()) {
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      ).then((UserCredential userCredential) {
                        print('User signed in successfully'); // Debugging line
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Login Success"),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  ChatScreen()));
                      }).catchError((error) {
                        print(error.toString()) ;

                        if (error is FirebaseAuthException) {
                          if (error.code == 'user-not-found') {
                            print('No user found for that email.'); // Debugging line
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("No user found for that email."),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 2),
                              ),
                            );
                          } else if (error.code == 'wrong-password') {
                            print('Wrong password provided for that user.'); // Debugging line
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Wrong password provided for that user."),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        } else {
                          print(error.toString()); // Debugging line
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(error.toString()),
                              backgroundColor: Colors.red,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                     }
                      }
                      );
                    }
                  },
                  color: Colors.white,
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text(
                  "don\'t have an email  : ",
                  style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  RegisterScreen()));
                  },
                  child: const Text(
                    "Register",
                    selectionColor: Colors.white,
                    style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w900),
                  ),
                ),
              ],
              ),
              const Spacer(flex: 5,),
            ],
          ),
        ),
      ),
    );
  }
}
