import 'package:googleapis_auth/auth_io.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleAuth {

  GoogleAuth(this.scopes, this.googleApiClientId);

  final List<String> scopes;
  final String googleApiClientId;

  void authenticate(void Function(AuthClient authClient) callback) {
    try {
      clientViaUserConsent(ClientId(googleApiClientId, ''), scopes, _prompt)
          .then((authClient) {
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
