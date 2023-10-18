import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Платежи"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                SizedBox(height: 30),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 1, 0, 15),
                    child:
                        CupertinoSearchTextField(placeholder: "Поиск счетов")),
                const Divider(height: 2),
                favourites(),
                sbp(),
                // Padding(
                //     padding: EdgeInsets.fromLTRB(0, 15, 0, 7),
                //     child: Text("ИЗБРАННОЕ")),
                // SingleChildScrollView(
                //   padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                //   scrollDirection: Axis.horizontal,
                //   child: Row(children: [
                //     FavouriteCardWidget(
                //       mainImg: 'assets/favourite_logos/megafon.png',
                //       subtitle: "Мегафон",
                //     ),
                //     FavouriteCardWidget(
                //       mainImg: 'assets/favourite_logos/tink.png',
                //       subtitle: "Мегафон",
                //     ),
                //     FavouriteCardWidget(
                //       mainImg: 'assets/favourite_logos/steam.png',
                //       subtitle: "Мегафон",
                //     ),
                //     FavouriteCardWidget(
                //       mainImg: 'assets/favourite_logos/human.png',
                //       subtitle: "Бабушка",
                //     ),
                //     FavouriteCardWidget(
                //       mainImg: 'assets/favourite_logos/human.png',
                //       subtitle: "Гена",
                //     )
                //   ]),
                // ),
                Placeholder(),
              ])),
        ));
  }

  Widget favourites() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 7), child: Text("ИЗБРАННОЕ")),
      SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            FavouriteCardWidget(
              mainImg: 'assets/favourite_logos/megafon.png',
              subtitle: "Мегафон",
            ),
            FavouriteCardWidget(
              mainImg: 'assets/favourite_logos/tink.png',
              subtitle: "Мегафон",
            ),
            FavouriteCardWidget(
              mainImg: 'assets/favourite_logos/steam.png',
              subtitle: "Мегафон",
            ),
            FavouriteCardWidget(
              mainImg: 'assets/favourite_logos/human.png',
              subtitle: "Бабушка",
            ),
            FavouriteCardWidget(
              mainImg: 'assets/favourite_logos/human.png',
              subtitle: "Гена",
            )
          ])),
    ]);
  }
}

Widget sbp() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 7), child: Text("СБП")),
    Padding(
      padding: const EdgeInsets.fromLTRB(4, 1, 4, 5),
      child: CupertinoTextField(placeholder: "+7 (999) 999-99-99"),
    ),
    SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          FavouriteCardWidget(
            mainImg: 'assets/favourite_logos/human.png',
            subtitle: "Себе",
          ),
          FavouriteCardWidget(
            mainImg: 'assets/favourite_logos/human.png',
            subtitle: "Рустам",
          ),
          FavouriteCardWidget(
            mainImg: 'assets/favourite_logos/human.png',
            subtitle: "Миша",
          ),
          FavouriteCardWidget(
            mainImg: 'assets/favourite_logos/human.png',
            subtitle: "Мария",
          ),
          FavouriteCardWidget(
            mainImg: 'assets/favourite_logos/human.png',
            subtitle: "Евгений",
          )
        ])),
  ]);
}

class FavouriteCardWidget extends StatelessWidget {
  String subtitle;
  String mainImg;
  // String secondaryImg;

  FavouriteCardWidget({
    super.key,
    required this.subtitle,
    required this.mainImg,
    // required this.secondaryImg,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 60,
            height: 80,
            child: Column(
                children: [Image(image: AssetImage(mainImg)), Text(subtitle)])),
        SizedBox(width: 20)
      ],
    );
  }
}
