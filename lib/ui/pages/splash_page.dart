part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 136,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 16),
              child: Text(
                'New Experience',
                style: blackTextStyle.copyWith(fontSize: 20),
              ),
            ),
            Text(
              'Watch a new movie much\neasier than any before',
              style: greyTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 19),
              width: 250,
              height: 46,
              color: mainColor,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: mainColor,
                  elevation: 0,
                ),
                onPressed: () {
                  context
                      .bloc<PageBloc>()
                      .add(GoToRegistrationPage(RegistrationData()));
                },
                child: Text(
                  'Get Started',
                  style: whiteTextStyle.copyWith(fontSize: 16),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an accaount? ',
                  style: greyTextStyle.copyWith(),
                ),
                GestureDetector(
                  onTap: () {
                    context.bloc<PageBloc>().add(
                          GoToLoginPage(),
                        );
                  },
                  child: Text(
                    'Sign In',
                    style: purpleTextStyle.copyWith(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
