import 'dart:io';

import 'package:googleapis_auth/auth_io.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleAuth {

  GoogleAuth(this.scopes);

  final List<String> scopes;

  ClientId get clientId {
    ClientId clientId;
    if (Platform.isAndroid) {
      clientId = ClientId(
          '',
          ''
      );
    } else if (Platform.isIOS) {
      clientId = ClientId(
          '''1060532045992-sf7aivmjo0808tdoavih5s12ucrr4l7u.apps.googleusercontent.com''',
          ''
      );
    }

    return clientId;
  }

  void authenticate(void Function(AuthClient authClient) callback) {
    try {
      clientViaUserConsent(clientId, scopes, _prompt).then((authClient) {
        callback(authClient);
        authClient.close();
      });
    } on Exception catch (ex) {
      print(ex.toString());
    }
  }

  Future<void> _prompt(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }
}