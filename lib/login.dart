import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
   final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[400],
      body: Center(
          child: Container(
            width: kIsWeb ? MediaQuery
                .of(context)
                .size
                .width / 1.5 : MediaQuery
                .of(context)
                .size
                .width,
            height: kIsWeb ? MediaQuery
                .of(context)
                .size
                .height / 1.5 : MediaQuery
                .of(context)
                .size
                .height,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)
            ),
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
                              key: formkey,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    kIsWeb ? SizedBox.shrink() : SizedBox(
                                      height: 50,
                                    ),
                                    Text("Login", style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RichText(text: TextSpan(
                                        text: "Doesn't Have an account yet?",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.green,
                                        ),
                                        children: const<TextSpan>[
                                          TextSpan(
                                              text: "Sign up",
                                              style: TextStyle(
                                                color: Colors.black,
                                                decoration: TextDecoration
                                                    .underline,
                                              )
                                          )
                                        ]
                                    )),
                                    SizedBox(height: 20),
                                    Text("Email Address", style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black.withOpacity(0.5)),
                                    ),
                                    Padding(padding: const EdgeInsets.only(
                                        right: 20, top: 5),
                                      child: TextFormField(
                                        keyboardType: TextInputType
                                            .emailAddress,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'yourname@gmail.com',
                                            hintStyle: TextStyle(fontSize: 18)
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text('Password', style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black.withOpacity(0.5))
                                    ),
                                    Padding(padding: const EdgeInsets.only(
                                        right: 20, top: 5),
                                      child: TextFormField(
                                          keyboardType: TextInputType
                                              .visiblePassword,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: '********',
                                              hintStyle: TextStyle(fontSize: 18)
                                          )
                                      ),),
                                    SizedBox(
                                        height: 20
                                    ),
                                    SizedBox(
                                        width: constraints.maxWidth,
                                        child: ElevatedButton(
                                          onPressed: () =>
                                          {
                                            Navigator.pushNamed(
                                                context, '/dashboard')
                                          },
                                          child: Text('Login'),
                                          style: ElevatedButton.styleFrom(
                                              elevation: 6),
                                        )
                                    )
                                  ]
                              ),
                            ),),
                        )
                    ),
                    kIsWeb ?
                    FractionallySizedBox(
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
                        child: Padding(padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/Images/Logo.png'),
                        ),
                      ),
                    ) : SizedBox.shrink(),
                  ],
                );
              },
            ),
          )
      ),
    );
  }
}
