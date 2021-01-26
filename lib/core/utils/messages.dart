import 'package:get/route_manager.dart';
import 'package:pokedex/core/constants/translations_constants.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          kPokemonString: "Pokemon",
          kPokedexString: "Pokedex",
          // Authentication
          kEnterEmailMsg: "Please enter your Email",
          kEnterPasswordMsg: "Please enter your password",
          kLoginString: "Log In",
          kRegisterString: "Sign In",
          // Erros
          kErrorMsg: "Error",
          kGenericErrorMsg: "There has ben an error",
        }
      };
}
