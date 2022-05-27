import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/routes.dart';
import 'package:mobileappclientv1/src/utils/utils.dart';
import 'package:mobileappclientv1/src/views/widgets/widgets.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _keyForm = GlobalKey();

  final GlobalKey<State> _keyLoader =
      GlobalKey<State>(debugLabel: "register  user");

  final TextEditingController _telephone = TextEditingController();

  final TextEditingController _password = TextEditingController();

  bool value = false;

  @override
  Widget build(BuildContext context) {
    // final l10n = AppLocalizations.of(context);
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    //TODO : Add the Form Widget to verify all controller and validator form
    return Stack(
      children: [
        BuildBackground(
          viewLogo: !isKeyboard ? true : false,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldCustomer(
                // hint: "Prénom", //l10n!.nom,
                label: "Prénom *",
                textAlign: TextAlign.left,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, left: 20.0, right: 15.0, bottom: 0),
                  child: SizedBox(
                    height: 10,
                    width: 10,
                  ),
                ),
              ),
              TextFieldCustomer(
                // hint: "Prénom", //l10n!.nom,
                label: "Nom *",
                textAlign: TextAlign.left,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, left: 20.0, right: 15.0, bottom: 0),
                  child: SizedBox(
                    height: 10,
                    width: 10,
                  ),
                ),
              ),
              TextFieldCustomer(
                // hint: "Prénom", //l10n!.nom,
                label: "Téléphone *",
                textAlign: TextAlign.left,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, left: 20.0, right: 15.0, bottom: 0),
                  child: SizedBox(
                    height: 10,
                    width: 10,
                  ),
                ),
              ),
              TextFieldCustomer(
                // hint: "Prénom", //l10n!.nom,
                label: "Email",
                textAlign: TextAlign.left,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, left: 20.0, right: 15.0, bottom: 0),
                  child: SizedBox(
                    height: 10,
                    width: 10,
                  ),
                ),
              ),
              TextFieldCustomer(
                // hint: "Prénom", //l10n!.nom,
                label: "30/09/1932",
                textAlign: TextAlign.left,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, left: 20.0, right: 15.0, bottom: 0),
                  child: SizedBox(
                    height: 10,
                    width: 10,
                  ),
                ),
              ),
              const Text("Sexe"),
              TextFieldCustomer(
                // hint: "Prénom", //l10n!.nom,
                label: "Mot de passe *",
                textAlign: TextAlign.left,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, left: 20.0, right: 15.0, bottom: 0),
                  child: SizedBox(
                    height: 10,
                    width: 10,
                  ),
                ),
              ),
              TextFieldCustomer(
                // hint: "Prénom", //l10n!.nom,
                label: "Confirmation du mot de passe *",
                textAlign: TextAlign.left,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, left: 20.0, right: 15.0, bottom: 0),
                  child: SizedBox(
                    height: 10,
                    width: 10,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ConnectisRedButtom(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.page);
                },
                descriprion: "Se Connecter", //l10n.seconnecter,
                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      foregroundColor: MaterialStateProperty.all(kWhiteColor),
                      overlayColor: MaterialStateProperty.all(
                        kGreyColor.withOpacity(.5),
                      ),
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/*
import 'package:flutter_vpn/flutter_vpn.dart';
import 'package:flutter_vpn/state.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _addressController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  var state = FlutterVpnState.disconnected;
  CharonErrorState? charonState = CharonErrorState.NO_ERROR;

  @override
  void initState() {
    FlutterVpn.prepare();
    FlutterVpn.onStateChanged.listen((s) => setState(() => state = s));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter VPN'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(12),
          children: <Widget>[
            Text('Current State: $state'),
            Text('Current Charon State: $charonState'),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(icon: Icon(Icons.map_outlined)),
            ),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person_outline),
              ),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(icon: Icon(Icons.lock_outline)),
            ),
            ElevatedButton(
              child: const Text('Connect'),
              onPressed: () => FlutterVpn.connectIkev2EAP(
                server: _addressController.text,
                username: _usernameController.text,
                password: _passwordController.text,
              ),
            ),
            ElevatedButton(
              child: const Text('Disconnect'),
              onPressed: () => FlutterVpn.disconnect(),
            ),
            ElevatedButton(
              child: const Text('Update State'),
              onPressed: () async {
                var newState = await FlutterVpn.currentState;
                setState(() => state = newState);
              },
            ),
            ElevatedButton(
              child: const Text('Update Charon State'),
              onPressed: () async {
                var newState = await FlutterVpn.charonErrorState;
                setState(() => charonState = newState);
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/