
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gg_mart/Controller/login_Controller.dart';


class Login extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[400],
      body: Center(
          child: Container(
        width: kIsWeb
            ? MediaQuery.of(context).size.width / 1.5
            : MediaQuery.of(context).size.width,
        height: kIsWeb
            ? MediaQuery.of(context).size.height / 1.5
            : MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Wrap(
              children: [
                FractionallySizedBox(
                    widthFactor: kIsWeb ? 0.5 : 1,
                    child: Container(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50, left: 50),
                        child: Form(
                          key: loginController.formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                kIsWeb
                                    ? SizedBox.shrink()
                                    : SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  "Login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800, fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .pushNamed('/register'),
                                  child: RichText(
                                      text: TextSpan(
                                          text: "Doesn't Have an account yet?",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.green,
                                          ),
                                          children: const <TextSpan>[
                                            TextSpan(
                                                text: "Sign up",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  decoration:
                                                  TextDecoration.underline,
                                                ))
                                          ])),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Email Address",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                                TextFormField(
                                  controller: loginController.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintText: "yourname@gmail.com",
                                    hintStyle: TextStyle(fontSize: 15),
                                    border: OutlineInputBorder(),
                                    //labelText: "email"
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child:Text('password'),),
                                    Expanded(
                                        child: Text('Forget Password',
                                          style: TextStyle(
                                            decoration: TextDecoration.underline,
                                            color: Colors.lightGreen,
                                          ),
                                        )),
                                  ],
                                ),
                                TextFormField(
                                  controller: loginController.passwordController,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: '**********',
                                    border: OutlineInputBorder(),
                                    //labelText: "password"
                                  ),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth,
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    FractionallySizedBox(
                                      widthFactor: 0.2,
                                      child: Obx(() {
                                        return Checkbox(
                                          value: loginController.isChecked.value,
                                          onChanged: (newValue) {
                                            print('newValue $newValue');
                                            if (newValue != null) {
                                              loginController
                                                  .toggleCheckbox(newValue);
                                            }
                                          },
                                        );
                                      }),
                                    ),
                                    FractionallySizedBox(
                                      widthFactor: 0.8,
                                      child: Text(
                                          'Agree to all conditions of the apps?'),
                                    ),
                                  ],
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(),
                                      onPressed: () async {},
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            50, 10, 50, 10),
                                        child: Text('login'),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                kIsWeb
                    ? FractionallySizedBox(
                        widthFactor: 0.5,
                        child: Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                            ),
                          ),
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/Images/Logo.png'),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            );
          },
        ),
      )),
    );
  }
}
