class ValidationMixin {

  String validateEmail (currentValue) {
    //validator needs null (default) if valid or error message if not valid
    //validating that email contains @
    if (!currentValue.contains("@")){
      return 'Please enter a valid email';
    }
    return null;
  }

  String validatePassword (currentValue) {
    if (currentValue.length < 4){
      return 'Password must be at least 4 characters';
    }
    return null;
  }

}