import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormApp extends StatelessWidget {
  const TextFormApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TextFormApp1(),
    );
  }
}

class TextFormApp1 extends StatefulWidget {
  const TextFormApp1({Key? key}) : super(key: key);

  @override
  _TextFormApp1State createState() => _TextFormApp1State();
}

enum AuthMode {LOGIN,SIGNUP}

class _TextFormApp1State extends State<TextFormApp1> {
  GlobalKey<FormState> _formKey=GlobalKey();
  AuthMode _authMode=AuthMode.LOGIN;

  Map<String,String> _authData={'email':'','password':''};

  var _passwordController=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form'),),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key:_formKey ,
                  child: Column(
                    children: [
                      TextFormField(
                decoration: InputDecoration(
                      hintText: 'email',
                      labelText: 'enter email here',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (val){
                      if(val!.isEmpty || !val.contains('@')){
                        return 'not valid email';
                      }return null;
                },
                        onSaved:(x){
                        _authData['email']=x!;
                          print('fffffffff ${x}');
                        } ,
              ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'enter password',
                          hintText: 'password',
                        ),
                        obscureText: true,
                        validator: (val){
                          if(val!.length<=5){
                            return 'password too short';
                          }return null;
                        },
                        onSaved: (val){
                          _authData['password']=val!;
                          print('ffffff ${val}');
                        },

                      ),
                      if(_authMode==AuthMode.SIGNUP)
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'r enter password',
                          hintText: 'password',
                        ),
                        obscureText: true,
                        validator: (val){
                          if(_passwordController.text!=val){
                            return 'password  not match';
                          }return null;
                        },
                        onSaved: (val){
                          _authData['password']=val!;
                          print('ffffff ${val}');
                        },

                      )
                    ],
                  ),),
            ),
            RaisedButton(onPressed: submit,
            //submit(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: Colors.blue.shade300,
            child: Text(_authMode ==AuthMode.LOGIN?'LOGIN':'SIGNUP'),
            textColor: Colors.white,),
            FlatButton(onPressed: switchLogin,
                child: Text('${_authMode==AuthMode.LOGIN?'SIGNUP':'LOGIN'} Instead'),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              textColor: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),

            )
          ],
        ),
      ),
    );
  }

  submit() {
    if(! _formKey.currentState!.validate()){
      return;
    }

    _formKey.currentState!.save();
  }

  switchLogin() {
    setState(() {
      if(_authMode==AuthMode.LOGIN){
        _authMode=AuthMode.SIGNUP;
      }else{
        _authMode=AuthMode.LOGIN;
      }

    });


  }

}

