import 'package:flutter/material.dart';
import 'package:stock_chatroom/screens/home_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var showPasscodeField = false;
  var email = "";
  var passcode = "";
  var buttomText = "GetPasscode";
  final _formKey = GlobalKey<FormState>();

  _checkEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter some text';
    }

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (!emailValid) {
      return 'Please enter an email.';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              margin: EdgeInsets.all(200.0),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
                width: 3.0,
              )),
              child: Column(
                children: [
                  Text(
                    'Input your email',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 80.0,
                    padding: EdgeInsets.only(left: 2.0),
                    child: Row(
                      children: [
                        Text(
                          'Email:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                            child: TextFormField(
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                              onChanged: (value) {
                                email = value;
                              },
                              validator: (value) => _checkEmail(value),
                              decoration: InputDecoration.collapsed(
                                  hintText: 'example@example.com'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  showPasscodeField
                      ? Container(
                          padding: EdgeInsets.only(left: 2.0),
                          child: Row(
                            children: [
                              Text(
                                'Passcode:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: TextField(
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.0,
                                      color: Colors.black,
                                    ),
                                    onChanged: (value) {
                                      passcode = value;
                                    },
                                    decoration: InputDecoration.collapsed(
                                        hintText: 'Input Passcode'),
                                  ),
                                ),
                              ),
                              Text(
                                'countdown',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10.0,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          height: 20.0,
                        ),
                  RaisedButton(
                    child: Text(
                      buttomText,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      if (showPasscodeField) {
                        print('in');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HomeScreen(),
                          ),
                        );
                      } else if (_formKey.currentState.validate()) {
                        setState(() {
                          print('Passcode');
                          showPasscodeField = true;
                          buttomText = "Login";
                        });
                      }
                    },
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'images/goicon.png',
                        scale: 0.7,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
