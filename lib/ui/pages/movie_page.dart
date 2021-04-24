part of 'pages.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // note: HEADER
        Container(
          decoration: BoxDecoration(
            color: accentColor1,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 30),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (_, userState) {
              if (userState is UserLoaded) {
                if (imageFileToUpload != null) {
                  uploadImage(imageFileToUpload).then((downloadURL) {
                    imageFileToUpload = null;
                    context
                        .bloc<UserBloc>()
                        .add(UpdateData(profileImage: downloadURL));
                  });
                }

                return Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xff5F5588),
                          width: 1,
                        ),
                      ),
                      child: Stack(
                        children: [
                          SpinKitFadingCircle(
                            color: accentcolor2,
                            size: 50,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: (userState.user.profilePicture == ''
                                      ? AssetImage('assets/user_pic.png')
                                      : NetworkImage(
                                          userState.user.profilePicture)),
                                  fit: BoxFit.cover),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              2 * defaultMargin -
                              78,
                          child: Text(
                            userState.user.name,
                            style: whiteTextStyle.copyWith(fontSize: 18),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id_ID',
                                  decimalDigits: 0,
                                  symbol: 'IDR ')
                              .format(userState.user.balance),
                          style: yellowNumberFont.copyWith(fontSize: 14),
                        ),
                      ],
                    )
                  ],
                );
              } else {
                return SpinKitFadingCircle(
                  color: accentcolor2,
                  size: 50,
                );
              }
            },
          ),
        ),

        // note: NOW PLAYING
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
          child: Text(
            'Now Playing',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 140,
          child: BlocBuilder<MovieBloc, MovieState>(builder: (_, movieState) {
            if (movieState is MovieLoaded) {
              List<Movie> movies = movieState.movies.sublist(0, 10);

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (_, index) => Container(
                  margin: EdgeInsets.only(
                    left: (index == 0) ? defaultMargin : 0,
                    right: (index == movies.length - 1) ? defaultMargin : 16,
                  ),
                  child: MovieCard(movies[index]),
                ),
              );
            } else {
              return SpinKitFadingCircle(
                color: mainColor,
                size: 50,
              );
            }
          }),
        ),

        // note: BROWSE MOVIE
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
          child: Text(
            'Browse Movie',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        BlocBuilder<UserBloc, UserState>(
          builder: (_, userState) {
            if (userState is UserLoaded) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    userState.user.selectedGenres.length,
                    (index) => BrowseButton(
                      userState.user.selectedGenres[index],
                    ),
                  ),
                ),
              );
            } else {
              return SpinKitFadingCircle(
                color: mainColor,
                size: 50,
              );
            }
          },
        ),

        // note: COMING SOON
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
          child: Text(
            'Coming Soon',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 140,
          child: BlocBuilder<MovieBloc, MovieState>(builder: (_, movieState) {
            if (movieState is MovieLoaded) {
              List<Movie> movies = movieState.movies.sublist(10);

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (_, index) => Container(
                  margin: EdgeInsets.only(
                    left: (index == 0) ? defaultMargin : 0,
                    right: (index == movies.length - 1) ? defaultMargin : 16,
                  ),
                  child: ComingSoonCard(movies[index]),
                ),
              );
            } else {
              return SpinKitFadingCircle(
                color: mainColor,
                size: 50,
              );
            }
          }),
        ),
      ],
    );
  }
}
