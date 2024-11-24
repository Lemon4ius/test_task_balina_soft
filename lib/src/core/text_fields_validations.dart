String? loginValidator(String? text){
  if(text!.isEmpty) return 'empty';
  if (text.length < 8 || text.length > 500) return 'size must be between 8 and 500';
  if (!RegExp(r"[a-z0-9_\\.@]").hasMatch(text)) return 'invalid characters are used';
  return null;
}

String? passwordValidator(String? text){
  if(text!.isEmpty) return 'empty';
  if (text.length < 8 || text.length > 500) return 'size must be between 8 and 500';
  return null;
}