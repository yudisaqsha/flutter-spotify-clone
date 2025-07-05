import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/buttons/basic_button.dart';
import 'package:movie_app/core/configs/assets/app.images.dart';
import 'package:movie_app/core/configs/assets/app.vectors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/configs/theme/app.colors.dart';
import 'package:movie_app/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.changeBackgroundPhoto),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              color: Colors.black.withValues(alpha: 0.4),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(AppVectors.spotifyLogo),
                  ),
                  Spacer(),
                  Text(
                    'Choose Mode',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(13),
                                backgroundColor: Colors.black.withValues(
                                  alpha: 0.12,
                                ),
                              ),
                              onPressed: () {
                                context.read<ThemeCubit>().updateTheme(
                                  ThemeMode.dark,
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: AppColors.background,
                                    content: Text(
                                      'Changed to Dark Mode',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              },
                              child: SvgPicture.asset(AppVectors.darkLogo),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Dark Mode',
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: AppColors.textgray,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(13),
                                backgroundColor: Colors.black.withValues(
                                  alpha: 0.12,
                                ),
                              ),
                              onPressed: () {
                                context.read<ThemeCubit>().updateTheme(
                                  ThemeMode.light,
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: AppColors.lightbackground,
                                    content: Text(
                                      'Changed to Light Mode',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              },
                              child: SvgPicture.asset(AppVectors.lightLogo),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Light Mode',
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: AppColors.textgray,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  BasicAppButton(onPressed: () {}, title: 'Continue'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
