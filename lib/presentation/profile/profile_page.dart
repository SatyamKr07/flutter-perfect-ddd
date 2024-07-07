// presentation/profile/profile_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth_cubit.dart';
import '../../application/my_app/my_app_cubit.dart';
import '../../application/my_app/my_app_state.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthCubit>().signOut();
            },
          ),
        ],
      ),
      body: BlocBuilder<MyAppCubit, MyAppState>(
        builder: (context, state) {
          return state.userModel != null
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: ${state.userModel!.name}',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Email: ${state.userModel!.email}',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 8),
                      state.userModel!.photoUrl.isNotEmpty
                          ? Image.network(state.userModel!.photoUrl)
                          : Container(),
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
