import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class Login_Page extends StatefulWidget {
  @override
  _Login_PageState createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final _formKey = GlobalKey<FormState>();
  FocusNode passwordFocusNode = FocusNode();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          ListView(
            children: <Widget>[
              _buildForm(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    double height = MediaQuery.of(context).size.height;
    return Card(
      margin: EdgeInsets.only(top: height *0.1, left: 30.0, right: 30.0),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _logo(),
              SizedBox(height: 70.0),
              _buildUsernameInput(),
              SizedBox(height: 22.0),
              _buildPasswordInput(),
              SizedBox(height: 30.0),
              _buildSubmitButton(),
              SizedBox(height: 30.0),
              buildSignInGoogleButton(),
              SizedBox(height: 90.0),
              buildSignupButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return Image(
      image: AssetImage('assets/images/logo.png'),
      fit: BoxFit.cover,
    );
  }

  Widget _buildUsernameInput() {
    return TextFormField(
      decoration: InputDecoration(

        labelText: 'ชื่อผู้ใช้ หรือ อีเมล',
        icon: Icon(Icons.account_box),
      ),
      onSaved: null,
      onFieldSubmitted: (String value) {
        FocusScope.of(context).requestFocus(passwordFocusNode);
      },
    );
  }

  Widget _buildPasswordInput() {
    return TextFormField(
      focusNode: passwordFocusNode,
      decoration: InputDecoration(
        labelText: 'รหัสผ่าน',
        icon: Icon(Icons.lock),
      ),
      obscureText: true,
      validator: _validatePassword,
      onSaved: null,
    );
  }

  String _validatePassword(String value) {
    if (value.length < 8) {
      return 'The password must ba at least 8 characters';
    }
    return null;
  }

  Widget _buildSubmitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        color: Colors.blue,
        onPressed: _submit,
        child:
            Text('เข้าสู่ระบบ',style: TextStyle(color: Colors.white,fontSize: 16.0)),
      ),
    );
  }

  void _submit() {
    if (!this._formKey.currentState.validate()) {
      Navigator.pushReplacementNamed(context, '/menu');
    } else {
      null;
    }
  }


  Widget buildSignInGoogleButton() {
    return FlatButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://cdn.discordapp.com/attachments/834620062090133543/836821196577964073/search.png',
            width: 40.0,
            height: 40.0,
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            'เข้าสู่ระบบด้วย Google',
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  Widget buildSignupButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('หากยังไม่มีบัญชีผู้ใช้',style:TextStyle(fontSize: 16),),
        FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: Text("ลงทะเบียนได้",style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline,fontSize: 16),),
        ),
      ],
    );
  }
}
