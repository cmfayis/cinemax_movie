import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    final auth = FirebaseAuth.instance;
    on<SignUpPageEvent>((event, emit) {
      emit(SignUpPageState());
    });

    on<ForgotPasswordEvent>((event, emit) {
      emit(ForgotPasswordState());
    });

    on<SignUpEvent>((event, emit) async {
      try {
        final userCredential = await auth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        final user = userCredential.user;
        if (user != null) {
          FirebaseFirestore.instance.collection('Users').doc(user.uid).set({
            'Name': event.name,
            'Email': event.email,
            "uid": user.uid,
            'CreatAt': DateTime.now(),
          });
          emit(SignUpState());
        }
      } catch (e) {
        print(e);
      }
    });
    on<LoginEvent>((event, emit) async {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      final user = userCredential.user;
      if (user != null) {
        emit(SignUpState());
      }
    });
     on<CheckLoginStatusEvent>((event, emit) async {
      User? users;
      try {
        await Future.delayed(const Duration(seconds: 2), () {
          users = auth.currentUser;
        });
        if (users != null) {
     
          emit(AuthenticatedState());
        } else {
          emit(UnAuthenticatedState());
        }
      } catch (e) {
        emit(ErrorAuthenctionState(error: e.toString()));
      }
    });
  }
}
