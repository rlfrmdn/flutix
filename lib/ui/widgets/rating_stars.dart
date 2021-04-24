part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  final double voteAverage;
  final double starSize;
  final double fontSize;

  RatingStars({this.voteAverage, this.starSize = 20, this.fontSize = 12});

  @override
  Widget build(BuildContext context) {
    int n = (voteAverage / 2).round();

    List<Widget> widgets = List.generate(
      5,
      (index) => Icon(
        index < n ? MdiIcons.star : MdiIcons.starOutline,
        color: accentcolor2,
        size: starSize,
      ),
    );

    widgets.add(
      SizedBox(
        width: 3,
      ),
    );
    widgets.add(
      Text(
        '$voteAverage/10',
        style: whiteTextStyle.copyWith(
          fontWeight: FontWeight.w300,
          fontSize: fontSize,
        ),
      ),
    );

    return Row(
      children: widgets,
    );
  }
}
