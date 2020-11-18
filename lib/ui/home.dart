import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:movelo/blocs/bloc.dart';
import 'package:movelo/models/biciusuario.dart';
import 'package:movelo/providers/estadoGlobal.dart';
import 'package:movelo/ui/widgets/Inputs.dart';
import 'package:movelo/ui/widgets/botonPrincipal.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Bloc bloc = new Bloc();
  int _current = 0;
  EstadoGlobal _myProvider;
  String _img = "assets/mov1.PNG";
  var _backgroundColor = Color(0xff17183B);
  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _loginWidth = 0;
  double _registerOffset = 0;
  double windowWidth = 0;
  double windowHeight = 0;
  double _longOpacity = 1;
  double _loginHeight = 0;
  double _registerHeight;
  bool _keyboardVisible = false;
  bool _enableSignButton = false;
  bool _enableRegisterButton = false;

  static TextEditingController controllerCedula =
      new TextEditingController(); // Maneja los datos ingresados por el input de Cedula
  static TextEditingController controllerNombre = new TextEditingController();
  static TextEditingController controllerCorreo = new TextEditingController();
  static TextEditingController controllerSignCorreo =
      new TextEditingController();
  static TextEditingController controllerSignContrasena =
      new TextEditingController();
  static TextEditingController controllerDireccion =
      new TextEditingController();
  static TextEditingController controllerTelefono = new TextEditingController();
  static TextEditingController controllerContrase = new TextEditingController();
  static TextEditingController controllerConContrase =
      new TextEditingController();

  static GlobalKey<FormFieldState> _correoFormKey = GlobalKey<FormFieldState>();
  static GlobalKey<FormFieldState> _cedulaFormKey = GlobalKey<FormFieldState>();
  static GlobalKey<FormFieldState> _nombreFormKey = GlobalKey<FormFieldState>();
  static GlobalKey<FormFieldState> _direccionFormKey =
      GlobalKey<FormFieldState>();
  static GlobalKey<FormFieldState> _telefonoFormKey =
      GlobalKey<FormFieldState>();
  static GlobalKey<FormFieldState> _passwordFormKey =
      GlobalKey<FormFieldState>();
  static GlobalKey<FormFieldState> _compPasswordFormKey =
      GlobalKey<FormFieldState>();
  static GlobalKey<FormFieldState> _correoSignFormKey =
      GlobalKey<FormFieldState>();
  static GlobalKey<FormFieldState> _passwordSignFormKey =
      GlobalKey<FormFieldState>();

  final _inputsText = [
    {
      'buttonSubmit': 'Enviar solicitud',
      'inputsText': [
        {
          'text': 'Correo',
          'controller': controllerSignCorreo,
          'keyBoardType': TextInputType.emailAddress,
          'obscureText': false,
          'icon': Icons.mail,
          'key': _correoSignFormKey,
        },
        {
          'text': 'Contraseña',
          'controller': controllerSignContrasena,
          'keyBoardType': TextInputType.visiblePassword,
          'obscureText': true,
          'icon': Icons.vpn_key,
          'key': _passwordSignFormKey,
        },
      ]
    },
    {
      'buttonSubmit': 'Enviar solicitud', //texto que aparecerá en el botón
      'inputsText': [
        //Lista de inputs que aparecerá en cada interfaz
        {
          'text': 'Correo', //Texto del input
          'controller':
              controllerCorreo, //controlador que maneja los datos ingresados
          'keyBoardType': TextInputType.emailAddress, //Tipo de texto ingresado
          'obscureText': false, //obscureText ... Para contraseñas
          'icon': Icons.mail,
          'key': _correoFormKey,
        },
        {
          'text': 'Cedula',
          'controller': controllerCedula,
          'keyBoardType': TextInputType.number,
          'obscureText': false,
          'icon': Icons.perm_identity,
          'key': _cedulaFormKey,
        },
        {
          'text': 'Nombre',
          'controller': controllerNombre,
          'keyBoardType': TextInputType.text,
          'obscureText': false,
          'icon': Icons.text_fields,
          'key': _nombreFormKey,
        },
        {
          'text': 'Direccion',
          'controller': controllerDireccion,
          'keyBoardType': TextInputType.text,
          'obscureText': false,
          'icon': Icons.location_city,
          'key': _direccionFormKey,
        },
        {
          'text': 'Telefono',
          'controller': controllerTelefono,
          'keyBoardType': TextInputType.number,
          'obscureText': false,
          'icon': Icons.phone,
          'key': _telefonoFormKey,
        },
        {
          'text': 'Contraseña',
          'controller': controllerContrase,
          'keyBoardType': TextInputType.visiblePassword,
          'obscureText': true,
          'icon': Icons.vpn_key,
          'key': _passwordFormKey,
        },
        {
          'text': 'Confirmar Contraseña',
          'controller': controllerConContrase,
          'keyBoardType': TextInputType.visiblePassword,
          'obscureText': true,
          'icon': Icons.vpn_key,
          'key': _compPasswordFormKey,
        }
      ]
    },
  ];
  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        _keyboardVisible = visible;
        print(visible);
      },
    );
  }

  void _presionaOpcion(int index) {
    setState(() {
      _current = index;
    });
  }

  bool _isFormValidRegister() {
    return ((_correoFormKey.currentState.isValid &&
        _cedulaFormKey.currentState.isValid &&
        _nombreFormKey.currentState.isValid &&
        _direccionFormKey.currentState.isValid &&
        _telefonoFormKey.currentState.isValid &&
        _passwordFormKey.currentState.isValid &&
        _compPasswordFormKey.currentState.isValid &&
        controllerContrase.text == controllerConContrase.text));
  }

  bool _isFormValidInicio() {
    return ((_correoSignFormKey.currentState.isValid &&
        _passwordSignFormKey.currentState.isValid));
  }

  void validarInicio(GlobalKey<FormFieldState> status) {
    setState(() {
      _enableSignButton = _isFormValidInicio();
      status.currentState.validate();
    });
  }

  void validarRegistro(GlobalKey<FormFieldState> status) {
    setState(() {
      _enableRegisterButton = _isFormValidRegister();
      status.currentState.validate();
    });
  }

  void irAHome() {
    Navigator.pushNamed(context, '/Maps');
  }

  void irAMapas(BuildContext context) {
    _myProvider.errorServidor = false;
    Alert(
            context: context,
            title: ('Bienvenido! '),
            buttons: [
              DialogButton(
                color: Colors.green,
                child: Text(
                  'Después de usted',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/Maps');
                },
                width: 120,
              )
            ],
            type: AlertType.success,
            desc: 'Siga usted ')
        .show();
  }

  Future iniciarSesion(BuildContext context) async {
    try {
      var resp = await bloc.iniciarSesion(
          // En bloc pusimos que si el usuario y contraseña estaban bien se devolvía true, de lo contrario, false
          controllerSignCorreo.text,
          controllerSignContrasena.text,
          context);
      if (!resp) {
        Alert(
                context: context,
                title: 'Uh-oh',
                buttons: [
                  DialogButton(
                    color: Colors.red,
                    child: Text(
                      'Okay',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () => Navigator.pop(context),
                    width: 120,
                  )
                ],
                type: AlertType.error,
                desc: 'Usuario o contraseña incorrecto')
            .show();
      } else {
        _myProvider.errorServidor = false;
        Alert(
                context: context,
                title: '',
                buttons: [
                  DialogButton(
                    color: Colors.green,
                    child: Text(
                      'Okay',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/HomeScreen');
                    },
                    width: 120,
                  )
                ],
                type: AlertType.success,
                desc:
                    'Hola de nuevo, ' + this._myProvider.biciusuarioUser.nombre)
            .show();
      }
    } on Exception {
      Alert(
              context: context,
              title: 'Uh-oh',
              buttons: [
                DialogButton(
                  color: Colors.red,
                  child: Text(
                    'Okay',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () => Navigator.pop(context),
                  width: 120,
                )
              ],
              type: AlertType.error,
              desc:
                  'Hubo un error de conexión, revisa tu conexión a internet e inténtalo de nuevo')
          .show();
    }
  }

  Future registrarse(BuildContext context) async {
    try {
      Biciusuario biciuser = new Biciusuario(
          //Primero se crea un objeto de tipo solicitud jugador con el contenido de los controller
          0,
          controllerCedula
              .text, //Spoiler... todos son Strings (no sé porqué pero el gestor que está en el servidor sólo reconoce este tipo de datos al hacer requests http)
          controllerCorreo.text,
          controllerConContrase.text,
          "",
          controllerNombre.text,
          controllerDireccion.text,
          controllerTelefono.text,
          0,
          0,
          0);
      var resp = await this.bloc.registrarUsuario(biciuser, context);
      if (!resp) {
        Alert(
                context: context,
                title: 'Uh-oh',
                buttons: [
                  DialogButton(
                    color: Colors.red,
                    child: Text(
                      'Okay',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () => Navigator.pop(context),
                    width: 120,
                  )
                ],
                type: AlertType.error,
                desc: 'Ya existe un usuario con esas credenciales')
            .show();
      } else {
        _myProvider.errorServidor = false;
        Alert(
                context: context,
                title: 'Bienvenido!',
                buttons: [
                  DialogButton(
                    color: Colors.green,
                    child: Text(
                      'Okay',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/HomeScreen');
                    },
                    width: 120,
                  )
                ],
                type: AlertType.success,
                desc: 'Te hemos registrado ' +
                    this._myProvider.biciusuarioUser.nombre)
            .show();
      }
    } on Exception {
      Alert(
              context: context,
              title: 'Uh-oh',
              buttons: [
                DialogButton(
                  color: Colors.red,
                  child: Text(
                    'Okay',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () => Navigator.pop(context),
                  width: 120,
                )
              ],
              type: AlertType.error,
              desc:
                  'Hubo un error de conexión, revisa tu conexión a internet e inténtalo de nuevo')
          .show();
    }
  }

  @override
  Widget build(BuildContext context) {
    _myProvider = Provider.of<EstadoGlobal>(context, listen: true);
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;
    _loginHeight = windowHeight - 270;
    _registerHeight = windowHeight - 270;
    switch (_current) {
      case 0:
        _backgroundColor = Color(0xff17183B);
        _img = "assets/mov1.PNG";
        _loginYOffset = windowHeight;
        _loginXOffset = 0;
        _loginWidth = windowWidth;
        _registerOffset = windowHeight;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;
        _longOpacity = 1;
        break;
      case 1:
        _backgroundColor = Color(0xff009787);
        _img = "assets/mov2.PNG";
        _loginYOffset = _keyboardVisible ? 40 : 270;
        _loginXOffset = 0;
        _loginWidth = windowWidth;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;
        _registerOffset = windowHeight;
        _longOpacity = 1;
        break;
      case 2:
        _backgroundColor = Color(0xff009787);
        _img = "assets/mov2.PNG";
        _loginYOffset = _keyboardVisible ? 30 : 240;
        _loginXOffset = 20;
        _loginWidth = windowWidth * 0.9;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 240;
        _registerOffset = _keyboardVisible ? 30 : 270;
        _longOpacity = 0.7;
        _registerHeight =
            _keyboardVisible ? windowHeight - 140 : windowHeight - 270;
        break;
      default:
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          AnimatedContainer(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background1.jpg"),
                  fit: BoxFit.cover),
            ),
            duration: Duration(
              milliseconds: 500,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _presionaOpcion(0);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Container(
                      child: Image.asset(_img),
                      height: 100,
                      width: 180,
                    ),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      irAHome();
                      //if (_current != 0) {
                      // _presionaOpcion(0);
                      //} else {
                      // _presionaOpcion(1);
                      // }
                    },
                    child: Container(
                      margin: EdgeInsets.all(32),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          "Iniciar",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff17183B),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedContainer(
            padding: EdgeInsets.all(32),
            height: _loginHeight,
            width: _loginWidth,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(
              milliseconds: 1000,
            ),
            transform:
                Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(_longOpacity),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Inicia sesión",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff17183B)),
                        ),
                      ),
                      ...(_inputsText[0]['inputsText']
                              as List<Map<String, Object>>)
                          .map((input) {
                        return Inputs(
                            input['text'],
                            input['controller'],
                            input['key'],
                            input['keyBoardType'],
                            input['obscureText'],
                            input['icon'],
                            () => validarInicio(
                                input['key'])); //Inputs con parámetros
                      }).toList(),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    BotonPrincipal(
                        btnText: "Iniciar sesión",
                        activo: _enableSignButton,
                        funcion: () => this.iniciarSesion(context)),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _presionaOpcion(2);
                        });
                      },
                      child: BotonSecundario(
                        btnText: "Ir a registro",
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          AnimatedContainer(
            padding: EdgeInsets.all(24),
            curve: Curves.fastLinearToSlowEaseIn,
            height: _registerHeight,
            duration: Duration(
              milliseconds: 1000,
            ),
            transform: Matrix4.translationValues(0, _registerOffset, 1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Center(
                          child: Text(
                            "Regístrate",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff17183B),
                            ),
                          ),
                        ),
                      ),
                      ...(_inputsText[1]['inputsText']
                              as List<Map<String, Object>>)
                          .map((input) {
                        return Inputs(
                            input['text'],
                            input['controller'],
                            input['key'],
                            input['keyBoardType'],
                            input['obscureText'],
                            input['icon'],
                            () => validarRegistro(
                                input['key'])); //Inputs con parámetros
                      }).toList(),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    BotonPrincipal(
                      btnText: "Registrarse",
                      activo: _enableRegisterButton,
                      funcion: () => this.registrarse(context),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _presionaOpcion(1);
                        });
                      },
                      child: BotonSecundario(
                        btnText: "Volver a inicio de sesión",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BotonSecundario extends StatefulWidget {
  final String btnText;
  BotonSecundario({this.btnText});
  @override
  _BotonSecundarioState createState() => _BotonSecundarioState();
}

class _BotonSecundarioState extends State<BotonSecundario> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color(0xff17183B),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.all(15),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(
            color: Color(0xff17183B),
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class Input extends StatefulWidget {
  final IconData icon;
  final String hint;

  Input({this.icon, this.hint});

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xff17183B),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            child: Icon(
              widget.icon,
              size: 20,
              color: Color(0xFFBB9B9B9),
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                hintText: widget.hint,
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
