import 'package:flutter/material.dart';
import 'package:fluttersubmission/main.dart';

class LoginState extends StatefulWidget{
  const LoginState({Key? key}) : super(key: key);
  static String tag = 'login-state';

  @override
  State<LoginState> createState() =>  _LoginPageState();
}

class _LoginPageState extends State<LoginState>{
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  late String nUsername;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/udanggoreng.png'),
            const SizedBox(height: 20,),
            const Text('Silahkan Login',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
            const SizedBox(height: 20,),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value){
                      if (value!.isEmpty){
                        return 'Username Anda';
                      }
                      return null;
                    },
                    autofocus: false,
                    maxLength: 20,
                    controller: usernameController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person, size: 40, color: Colors.black,),
                        hintText: 'Masukkan Username Anda',
                        hintStyle: TextStyle(color: Colors.grey),
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.grey)
                    ),
                  ),

                  const SizedBox(height: 20,),

                  Card(
                    color: Colors.blue,
                    elevation: 5,
                    child: SizedBox(
                      height: 50,
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: (){
                          nUsername = usernameController.text;
                          if(_formKey.currentState!.validate()){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                              return MainScreen(username: nUsername);
                            }));
                          }
                        },
                        child: const Center(
                          child: Text(
                            "Masuk",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}