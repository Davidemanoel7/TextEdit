String validatePass(String? pass) {

  if (pass!.isEmpty || pass.length < 2 || pass.length > 20 ){
    return 'A senha deve ter entre 2 e 20 caracteres';
  } else if (pass.contains(RegExp(r'^[a-zA-Z0-9]+$')) || pass.endsWith(' ')){
    return 'A senha deve ter apenas letras e números';
  }
  return '';
}

String validateUser(String? nickname) {
  if (nickname!.isEmpty || nickname.length < 2 || nickname.length > 20 || nickname.endsWith(' ')){
    return 'O nickname deve ter entre 2 e 20 caracteres';
  } else {
    return '';
  }
}