import 'package:toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login/models/user_model.dart';
import 'package:login/provider/user_provider.dart';
import 'package:login/screen/home/home_screen.dart';
import '../../provider/services.dart' as services;

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  // List<User> user = new List();
  @override
  void initState() {
    super.initState();
  }

  TextEditingController usuarioController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    ));
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 120.0,
            ),
          ),
          Container(
            width: size.width * 0.70,
            padding: EdgeInsets.symmetric(vertical: 30.0),
            margin: EdgeInsets.only(top: 80.0, bottom: 60.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: <Widget>[
                _crearUsuario(),
                SizedBox(
                  height: 10.0,
                ),
                _crearPassword(),
                SizedBox(
                  height: 10.0,
                ),
                _crearBoton(),
                SizedBox(
                  height: 4.0,
                ),
                _crearBotonRegistrar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearBoton() {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: Text(
          'Ingresar',
          style: TextStyle(color: Colors.white),
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 0.0,
      color: Colors.red,
      textColor: Colors.white,
      onPressed: () => {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()))
      },
    );
  }

  Widget _crearBotonRegistrar() {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
        child: Text(
          'Registrar',
          style: TextStyle(color: Colors.white),
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 0.0,
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: () => Navigator.pushNamed(context, 'registrar'),
    );
  }

  loguearse() async {
    final provider = Provider.of<UserProvider>(context);
    List<User> user = await services.autenticando(
        usuarioController.text, passwordController.text);

    if (user.isEmpty) {
      Toast.show("usuario o contraseña incorrecta", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    } else {
      provider.setUser = user[0];
    }
  }

  Widget _crearUsuario() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.person, color: Colors.blue),
                labelText: 'Usuario',
                counterText: snapshot.data,
                errorText: snapshot.error),
            controller: usuarioController,
          ),
        );
      },
    );
  }

  Widget _crearPassword() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.lock_outline,
                  color: Colors.blue,
                ),
                labelText: 'Contraseña',
                counterText: snapshot.data,
                errorText: snapshot.error),
            controller: passwordController,
          ),
        );
      },
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoNegro = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Colors.blue,
              Colors.blue
              // Color.fromRGBO(0, 0, 0, 1.0),
              // Color.fromRGBO(0, 0, 0, 1.0),
            ],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          )),
    );
    return Stack(
      children: <Widget>[
        fondoNegro,
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 25.0,
                width: double.infinity,
              ),
              Text(
                'ODONTORISO',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
