import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app_clean_architecture/config/routes/app_router.gr.dart';
import 'package:news_app_clean_architecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:news_app_clean_architecture/features/auth/presentation/bloc/auth_event.dart';
import 'package:news_app_clean_architecture/features/auth/presentation/bloc/auth_state.dart';
import 'package:news_app_clean_architecture/features/auth/presentation/widgets/inapp_browser.dart';
import 'package:reactive_forms/reactive_forms.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  static const routeName = "/login";

  final FormGroup form = FormGroup({
    'email': FormControl<String>(
        // validators: [Validators.required, Validators.email],
        ),
    'password': FormControl<String>(
        // validators: [Validators.required, Validators.minLength(4)],
        ),
  });

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppbar(context), body: _buildBody(context));
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Login',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) => {
              if (state is NoneAuthenticated)
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error!.message)))
                }
            },
        builder: (_, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ReactiveForm(
              formGroup: form,
              child: Column(
                children: [
                  ReactiveTextField<String>(
                    formControlName: 'email',
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  ReactiveTextField<String>(
                    formControlName: 'password',
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                  SizedBox(height: 20.0),
                  if (state is AuthLoading) const CircularProgressIndicator(),
                  Text(state.isAuthenticated.toString()),
                  ReactiveFormConsumer(
                    builder: (context, form, child) {
                      return ElevatedButton(
                        onPressed: form.valid
                            ? () {
                                final email = form.control('email').value;
                                final password = form.control('password').value;
                                // _bloc.add(AuthLogin(
                                //     email: email, password: password));
                                BlocProvider.of<AuthBloc>(context).add(
                                    Login(email: email, password: password));
                                // BlocProvider.of<AuthBloc>(context)
                                //     .add(CheckAuth());
                              }
                            : null,
                        child: const Text('Login'),
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(CheckAuth());
                      // BlocProvider.of<AuthBloc>(context)
                      //     .add(CheckAuth());
                    },
                    child: const Text('Check'),
                  ),
                  OutlinedButton.icon(
                      onPressed: () =>
                          {context.router.push(Oauth2HandlerX())},
                      // onPressed: () async {
                      //   await Oauth2HandlerX(request: GOOGLE_AUTH_URL)
                      //       .openInAppBrowser();
                      // },
                      icon: const Icon(Ionicons.logo_google),
                      label: const Text("Use google")),
                ],
              ),
            ),
          );
        });
  }
}
