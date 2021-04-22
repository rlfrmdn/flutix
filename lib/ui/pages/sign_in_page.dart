part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isemailValid = false;
  bool isPasswordvalid = false;
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    context.bloc<ThemeBloc>().add(
          ChangeTheme(
            ThemeData().copyWith(primaryColor: accentcolor2),
          ),
        );
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(
              GoToSplashPage(),
            );

        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 70,
                    child: Image.asset('assets/logo.png'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 70, bottom: 40),
                    child: Text(
                      'Welcome back,\nExplorer',
                      style: blackTextStyle.copyWith(fontSize: 20),
                    ),
                  ),
                  TextField(
                    onChanged: (text) {
                      setState(
                        () {
                          isemailValid = EmailValidator.validate(text);
                        },
                      );
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Email Address',
                      hintText: 'Email Address',
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    onChanged: (text) {
                      setState(
                        () {
                          isPasswordvalid = text.length >= 6;
                        },
                      );
                    },
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Password',
                      hintText: 'Password',
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        'Forgot password? ',
                        style: greyTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Get Now',
                        style: purpleTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(
                        top: 40,
                        bottom: 30,
                      ),
                      child: isSigningIn
                          ? SpinKitFadingCircle(
                              color: mainColor,
                            )
                          : FloatingActionButton(
                              onPressed: isemailValid && isPasswordvalid
                                  ? () async {
                                      setState(
                                        () {
                                          isSigningIn = true;
                                        },
                                      );
                                      SignInSignUpResult result =
                                          await AuthServices.signIn(
                                              emailController.text,
                                              passwordController.text);

                                      if (result.user == null) {
                                        setState(
                                          () {
                                            isSigningIn = false;
                                          },
                                        );

                                        Flushbar(
                                          duration: Duration(seconds: 4),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          backgroundColor: Color(0xffFF5C83),
                                          message: result.message,
                                        )..show(context);
                                      }
                                    }
                                  : null,
                              backgroundColor: isemailValid && isPasswordvalid
                                  ? mainColor
                                  : Color(0xffE4E4E4),
                              elevation: 0,
                              child: Icon(
                                Icons.arrow_forward,
                                color: isemailValid && isPasswordvalid
                                    ? Colors.white
                                    : Color(0xffBEBEBE),
                              ),
                            ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Start Fresh Now? ',
                        style: greyTextStyle.copyWith(),
                      ),
                      Text(
                        'Sign Up',
                        style: purpleTextStyle.copyWith(),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
