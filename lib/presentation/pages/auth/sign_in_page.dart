import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../application/auth/auth_cubit.dart';
import '../../../domain/core/di/injection.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Center(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              authenticated: (user) {},
              failure: (failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sign in failed')),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              authenticating: () => const CircularProgressIndicator(),
              orElse: () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthCubit>().signInWithGoogle();
                    },
                    child: const Text('Sign in with Google (User)'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthCubit>().signInAsGuest();
                    },
                    child: const Text('Guest Login'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to admin login page
                    },
                    child: const Text('Admin Login'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
