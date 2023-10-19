import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Dashboard.dart';
import 'package:pinput/pinput.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String checkstate = "false";
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkstatefun(checkstate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: SizedBox(
                  height: 250,
                  width: 350,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: Text(
                          "Admin Login",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Directionality(
                              // Specify direction if desired
                              textDirection: TextDirection.ltr,
                              child: Pinput(
                                controller: pinController,
                                focusNode: focusNode,
                                androidSmsAutofillMethod:
                                    AndroidSmsAutofillMethod.smsUserConsentApi,
                                listenForMultipleSmsOnAndroid: true,
                                separatorBuilder: (index) =>
                                    const SizedBox(width: 8),
                                validator: (value) {
                                  return value == '2222'
                                      ? pinController.text = "true"
                                      : 'Pin is incorrect';
                                },
                                hapticFeedbackType:
                                    HapticFeedbackType.lightImpact,
                                onCompleted: (pin) {
                                  checkstatefun(checkstate);
                                  debugPrint('onCompleted: $pin');
                                },
                                onChanged: (value) {
                                  debugPrint('onChanged: $value');
                                },
                                cursor: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 9),
                                      width: 22,
                                      height: 1,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  void checkstatefun(String checkstate) {
    if (pinController.text == "true") {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DashBoard(),
      ));
    }
  }
}
