import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdmottu/core/component_form/input_field.dart';
import 'package:mdmottu/core/scaffold_app/scaffold_app.dart';
import 'package:mdmottu/features/auth/domain/entities/request_auth.dart';
import 'package:mdmottu/features/design_system/colors/colors_app.dart';
import 'package:mdmottu/lang/app_translation.dart';
import 'package:provider/provider.dart';

import '../../../../core/component_form/button_app.dart';
import '../../../../core/validator_form/validators.dart';
import '../../../debug_view/controllers/debug_view_controller.dart';
import '../controllers/auth_controller.dart';
import '../widgets/box_text_helper.dart';

class AuthPhone extends StatefulWidget {
  final AuthController controller;

  const AuthPhone({Key? key, required this.controller}) : super(key: key);

  @override
  State<AuthPhone> createState() => _AuthPhoneState();
}

class _AuthPhoneState extends State<AuthPhone> {
  final _formKey = GlobalKey<FormState>();
  RequestAuth requestAuth = const RequestAuth();
  AuthController get _controller => widget.controller;
  final loginEC = TextEditingController();
  final passEC = TextEditingController();
  final passFN = FocusNode();
  final loginFN = FocusNode();

  @override
  void dispose() {
    loginEC.dispose();
    passEC.dispose();
    loginFN.dispose();
    passFN.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var debugViewController = Provider.of<DebugViewController>(context);
    return ScaffoldApp(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.account_circle_rounded, size: 120, color: ColorsApp.ff222E50),
              const SizedBox(height: 20),
              InputField(
                padding: const EdgeInsets.symmetric(vertical: 10),
                maxLength: 100,
                autofocus: true,
                hintText: AppTranslationString.string('login_hint'),
                controller: loginEC,
                focusNode: loginFN,
                labelText: AppTranslationString.string('login_label'),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                enabled: !_controller.loading.value,
                onSaved: (data) {
                  if (data != null) requestAuth = requestAuth.copyWith(login: data);
                },
                validator: Validators.multiple([
                  Validators.required(),
                  Validators.email(),
                ]),
              ),
              InputField(
                padding: const EdgeInsets.symmetric(vertical: 10),
                maxLength: 20,
                controller: passEC,
                focusNode: passFN,
                labelText: AppTranslationString.string('pass_label'),
                hintText: AppTranslationString.string('pass_hint'),
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obscureText: !_controller.visiblePassword.value,
                visibleSuffixIcon: true,
                enabled: !_controller.loading.value,
                suffixIconWidget: Visibility(
                  visible: _controller.visiblePassword.value,
                  replacement: const Icon(Icons.visibility_off_outlined, color: ColorsApp.ff222E50),
                  child: const Icon(Icons.visibility_outlined, color: ColorsApp.ff222E50),
                ),
                onPressedSuffixIcon: () => _controller.visiblePasswordShow(),
                onSaved: (data) {
                  if (data != null) {
                    requestAuth = requestAuth.copyWith(password: data.toLowerCase());
                  }
                },
                validator: Validators.multiple([
                  Validators.required(),
                ]),
              ),
              const SizedBox(height: 20),
              const BoxTextHelper(text: 'Login: ', description: 'teste@teste.com'),
              const BoxTextHelper(text: 'Senha: ', description: '123'),
              const SizedBox(height: 20),
              Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: _controller.loading,
                    builder: (_, bool loading, child) {
                      return Expanded(
                        child: ButtonApp(
                          onPressed: loading
                              ? null
                              : () async {
                                  var formValid = _formKey.currentState?.validate() ?? false;
                                  if (formValid) {
                                    _formKey.currentState?.save();
                                    await _controller.signIn(requestAuth, debugViewController);
                                  }
                                },
                          childRaisedButton: Visibility(
                            visible: loading,
                            replacement: Text('Entrar', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: ColorsApp.ffFFFFFF)),
                            child: const CupertinoActivityIndicator(color: ColorsApp.ffFFFFFF),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
