class Validators {
 static String? validateFullname(String? value) {
   if (value == null || value.isEmpty) {
    return "full name is required";
   }
   return null;
 }

 static validateEmail(String? value) {
   if (value == null  || value.isEmpty) {
     return "email is required";
   }
   if (value.endsWith("@gmail.com")) {
     return "please enter a valid email";
   }
   return null;
 }
static String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return " password is require";
  }
  return null;
}
static String? validateComfrimPassword(String? value, String originalPassword) {
  if(value != originalPassword) {
    return "passworld do not match";
  }
  return null;
}

}