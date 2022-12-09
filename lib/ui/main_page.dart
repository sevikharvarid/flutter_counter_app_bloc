import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/bloc/main_event.dart';

import '../bloc/main_bloc.dart';
import '../bloc/main_state.dart';
import '../constant/constants.dart';

class MainPage extends StatelessWidget {
  int? value;
  MainPage({Key? key, this.value}) : super(key: key);
  // MainPage(this.value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainBloc, MainState>(
        builder: (ctx, state) {
          return Stack(
            children: [
              customContainerBackground(
                context: context,
                isAsset: true,
                isGradient: true,
                imageUrl: "assets/images/login_background.svg",
                gradient: [Palette.green60, Palette.darkGreen],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 25),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Palette.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            InkWell(
                              child: Text("Increament"),
                              onTap: () {
                                context.read<MainBloc>().add(Increament());
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Palette.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            InkWell(
                              child: Text("Decreament"),
                              onTap: () {
                                context.read<MainBloc>().add(Decreament());
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Palette.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Text("Nilai : ${state.value}"),
                          ],
                        ),
                      ),
                    ]),
              )
            ],
          );
        },
      ),
    );
  }
}

Container customContainerBackground({
  required BuildContext context,
  bool? isAsset,
  bool? isGradient,
  String? imageUrl,
  List<Color>? gradient,
}) {
  dynamic image = isAsset!
      ? SvgPicture.asset(
          imageUrl!,
          fit: BoxFit.fitWidth,
          cacheColorFilter: true,
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width,
        )
      : SvgPicture.network(
          imageUrl!,
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width,
        );

  return Container(
    alignment: Alignment.bottomCenter,
    decoration: isGradient!
        ? BoxDecoration(gradient: LinearGradient(colors: gradient!))
        : BoxDecoration(),
    child: image,
  );
}
