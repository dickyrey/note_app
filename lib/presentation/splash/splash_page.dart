import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/presentation/routes/router.gr.dart';

import '../../application/auth/auth_bloc.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) {
            return ExtendedNavigator.of(context)
                .pushReplacementNamed(Routes.notesOverviewPage);
          },
          unauthenticated: (_) {
            return ExtendedNavigator.of(context)
                .pushReplacementNamed(Routes.signInPage);
          },
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
