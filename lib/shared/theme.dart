part of 'shared.dart';

const double defaultMargin = 24.0;

Color mainColor = Color(0xff503E9D);
Color accentColor1 = Color(0xff2C1F63);
Color accentcolor2 = Color(0xffFBD460);
Color accentColor3 = Color(0xffADADAD);

TextStyle blackTextStyle = GoogleFonts.raleway().copyWith(
  color: Colors.black,
  fontWeight: FontWeight.w500,
);

TextStyle whiteTextStyle = GoogleFonts.raleway().copyWith(
  color: Colors.white,
  fontWeight: FontWeight.w500,
);

TextStyle purpleTextStyle = GoogleFonts.raleway().copyWith(
  color: mainColor,
  fontWeight: FontWeight.w500,
);

TextStyle greyTextStyle = GoogleFonts.raleway().copyWith(
  color: accentColor3,
  fontWeight: FontWeight.w500,
);

TextStyle whiteNumberFont = GoogleFonts.openSans().copyWith(
  color: Colors.white,
);

TextStyle yellowNumberFont = GoogleFonts.openSans().copyWith(
  color: accentcolor2,
);
