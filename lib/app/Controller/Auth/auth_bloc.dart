import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    final auth = FirebaseAuth.instance;
    final db = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    on<SignUpPageEvent>((event, emit) {
      emit(SignUpPageState());
    });

    on<ForgotPasswordEvent>((event, emit) {
      emit(ForgotPasswordState());
    });

    on<SignUpEvent>((event, emit) async {
      try {
        auth.createUserWithEmailAndPassword(
            email: event.email, password: event.password);

        await db.collection('Users').doc(user!.uid).set({
          "Name": event.name,
          "Email": event.email,
          "Password": event.password,
        });
        emit(SignUpState());
      } catch (e) {
        print(e);
      }
    });
    on<LoginEvent>((event, emit) async {
         auth.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      // final user = UserCredential.user;
      // if (user != null) {
        emit(SignUpState());
      // }
    });
  }
}
