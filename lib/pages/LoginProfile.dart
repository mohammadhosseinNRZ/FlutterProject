import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validation/main.dart';
import 'package:form_validation/pages/AppBody.dart';
import 'package:hive/hive.dart';

class LoginProfile extends StatelessWidget {
  bool _isLogin = true;
  LoginProfile(this._isLogin);
  String _userName;
  String _password;
  var _key = GlobalKey<FormState>();
  String _myValidator(String temp) {
    if (temp.isEmpty || temp.length < 4) {
      return "Wrong input";
    }
    return null;
  }

  void _saveName(String name) {
    this._userName = name;
  }

  void _saveNumber(String number) {
    this._password = number;
  }

  void _saveData() {
    Hive.box(userNames).put(_userName, _password);
  }

  void _loginConfirmed(BuildContext context) {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      _saveData();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AppBody(_userName)));
    }
  }

  void _profileConfirmed() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
    }
    if (Hive.box("userNames").get(_userName) != null) {
      Hive.box("userNames").put(_userName, _password);
    }
  }

  BoxDecoration _myBoxdecoration = BoxDecoration(
    color: Colors.white,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.all(Radius.circular(30)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
      )
    ],
  );
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          margin: EdgeInsets.only(bottom: 2),
          padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orange[800], Colors.orange[100]]),
            color: Colors.orange[700],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.grey,
              )
            ],
          ),
          child: Positioned(
              child: Text(
            _isLogin ? "Login" : "Profile",
            style: TextStyle(color: Colors.red, fontSize: 40),
          )),
          alignment: Alignment.bottomRight,
        ),
        Form(
          key: _key,
          child: Column(
            children: [
              Container(
                decoration: _myBoxdecoration,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                margin: EdgeInsets.symmetric(vertical: 15),
                width: 300,
                child: Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                        ],
                        validator: _myValidator,
                        onSaved: _saveName,
                        decoration: InputDecoration(hintText: "UserName"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: _myBoxdecoration,
                  child: Row(
                    children: [
                      Icon(Icons.lock),
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          obscureText: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Z0-9]')),
                          ],
                          validator: _myValidator,
                          onSaved: _saveNumber,
                          decoration: InputDecoration(hintText: "Password"),
                        ),
                      )
                    ],
                  )),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                    )
                  ],
                ),
                child: TextButton(
                    onPressed: () {
                      _isLogin ? _loginConfirmed(context) : _profileConfirmed();
                    },
                    child: Text(_isLogin ? "LOGIN" : "Confirm Changes")),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
