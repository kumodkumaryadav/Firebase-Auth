

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Auth {
final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
User? get currentUser=> _firebaseAuth.currentUser;
Stream<User?> get authStateChanges=>_firebaseAuth.authStateChanges();

//method for signing via EmailPassword 
Future<void> signInWithEmailAndPassword({
  required String email,
  required String password,

}) async{
  await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password, );
}

//method for signUp via email password
Future<void> createUserWithEmailAndPassword({
  required String email,
  required String password
}) async{
  await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
}

//method for signing via direct google
Future signInWithGoogle()async{
  final GoogleSignInAccount? googleUser= await GoogleSignIn(
    scopes: <String> ["email"]).signIn();

  final GoogleSignInAuthentication googleAuth=await googleUser!.authentication;
  final credential =GoogleAuthProvider.credential(accessToken: googleAuth.accessToken,
  idToken: googleAuth.idToken);
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
//method for getting token
Future<String?> getDeviceToken() async {
  String? token;
   await currentUser!.getIdTokenResult().then((result){
      token=result.token.toString();
    });
    return  token;
}
String verificationId="";

veryfyPhoneNumber(String phoneNumner)async {
  await _firebaseAuth.verifyPhoneNumber(
    phoneNumber: phoneNumner,
    timeout: Duration(seconds: 60),
    verificationCompleted: (AuthCredential authCredential){
      
    },
     verificationFailed: (FirebaseAuthException exception){}, 
     codeSent: (String? verId, int? codeForceReSend){
      verificationId=verId!;
     }, 
     codeAutoRetrievalTimeout: (String verId){});
}

signInWithPhone(String smsCode)async{
 return await _firebaseAuth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode));
}
//method for signOut
Future<void> signOut() async{
  await _firebaseAuth.signOut();
}
}

