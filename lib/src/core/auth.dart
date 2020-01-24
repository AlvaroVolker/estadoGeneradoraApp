import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';


final Config config = new Config(
  "aesgener.cl",
  "b4d0e974-cc94-4f53-beb0-e27b82b7eb3d",
  "",
  "https://consolaoperacionesdev.azurewebsites.net/"
);

final AadOAuth oAuth = new AadOAuth(config);

var login = oAuth.login();

class AuthService{
}

