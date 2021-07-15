import 'package:flutter/material.dart';

import 'package:foc_ui/foc_ui.dart';

class WidgetListScreen extends StatefulWidget {
  const WidgetListScreen({Key? key}) : super(key: key);

  @override
  _WidgetListScreenState createState() => _WidgetListScreenState();
}

class _WidgetListScreenState extends State<WidgetListScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  bool hidePassword = true;

  final _formKey = GlobalKey<FormState>();

  final _loginFocus = FocusNode();
  final _passwordFocus = FocusNode();

  void _submitFormHandler() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // ignore: avoid_print
      print('Login: ${_loginController.text}');
      // ignore: avoid_print
      print('Password: ${_passwordController.text}');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _loginController.dispose();
    _passwordController.dispose();
    _loginFocus.dispose();
    _passwordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Widgets example',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                fInputField(
                  controller: _loginController,
                  placeholder: 'Login',
                  label: 'Login',
                  focusNode: _loginFocus,
                  onFieldSubmitted: (_) => fieldFocusChange(
                    context,
                    _loginFocus,
                    _passwordFocus,
                  ),
                  validatorCallback: (login) => validateLogin(login),
                ),
                hSpaceRegular,
                fInputField(
                  controller: _passwordController,
                  placeholder: 'Password',
                  focusNode: _passwordFocus,
                  isPassword: hidePassword,
                  validatorCallback: (pass) => validatePassword(pass),
                  trailing: Icon(
                    hidePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  trailingTapped: () => setState(
                    () => hidePassword = !hidePassword,
                  ),
                ),
                hSpaceLarge,
                TextButton(
                  onPressed: _submitFormHandler,
                  child: const Text('Submit'),
                ),
                const Divider(),
                hSpaceRegular,
                fText.heading1('Heading 1', context: context),
                fText.heading2('Heading 2', context: context),
                fText.heading3('Heading 3', context: context),
                fText.heading4('Heading 4', context: context),
                fText.heading5('Heading 5', context: context),
                fText.heading6('Heading 6', context: context),
                hSpaceRegular,
                fText.bodyText1('Body text 1', context: context),
                fText.bodyText2('Body text 2', context: context),
                hSpaceRegular,
                fText.subtitle1('Subtitle 1', context: context),
                fText.subtitle2('Subtitle 2', context: context),
                hSpaceRegular,
                fText.caption('Caption', context: context),
                fText.overline('Overline', context: context),
                fText.button('Button', context: context),
                fText.styled(
                  'Styled text',
                  const TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                hSpaceRegular,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
