import 'package:flutter/material.dart';
import 'package:openid_client/openid_client.dart';
import 'openid_io.dart' if (dart.library.html) 'openid_browser.dart';

const keycloakUri = 'https://demo-hcktn.octonezd.me/application/o/gromitbank/';
const scopes = ['profile'];

Credential? credential;

late final Client client;

Future<Client> getClient() async {
  var uri = Uri.parse(keycloakUri);
  // if (!kIsWeb && Platform.isAndroid) uri = uri.replace(host: '10.0.2.2');
  var clientId = 'YHkauJgG3VlKtaqb9hSpjEKCOymCK2RobGyFCslV';
  var secret =
      'ag2Mmbuq3eR4Z7olaU07pO2QIawHmh4oBLssQ2PnhGSz9TovqP3VluZ2fiQa2gqxqDlC1ArlDQvtAREWyGRNXpvGTvi4bnDBAwHTyYQKb1qR3FagjFh9mkZAuEN8SRdL';

  var issuer = await Issuer.discover(uri);
  return Client(issuer, clientId, clientSecret: secret);
}

Future<void> main() async {
  client = await getClient();
  credential = await getRedirectResult(client, scopes: scopes);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'openid_client demo',
      home: MyHomePage(title: 'openid_client Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserInfo? userInfo;

  @override
  void initState() {
    if (credential != null) {
      credential!.getUserInfo().then((userInfo) {
        setState(() {
          this.userInfo = userInfo;
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (userInfo != null) ...[
              Text('Hello ${userInfo!.name}'),
              Text(userInfo!.email ?? ''),
              OutlinedButton(
                  child: const Text('Logout'),
                  onPressed: () async {
                    setState(() {
                      userInfo = null;
                    });
                  })
            ],
            if (userInfo == null)
              OutlinedButton(
                  child: const Text('Login'),
                  onPressed: () async {
                    var credential = await authenticate(client, scopes: scopes);
                    var userInfo = await credential.getUserInfo();
                    setState(() {
                      this.userInfo = userInfo;
                    });
                  }),
          ],
        ),
      ),
    );
  }
}
