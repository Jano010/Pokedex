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
          kWeakPasswordMsg: 'The password is to weak, try another password',
          kEmailUsedMsg: "The email is already in use, please try another one",
          kUserNotFoundMsg: 'The user was not found, please try again',
          kWrongPasswordMsg: 'Wrong password',
          // Erros
          kErrorMsg: "Error",
          kGenericErrorMsg: "Something went wrong",
        }
      };
}
