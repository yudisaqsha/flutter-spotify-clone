import 'package:flutter/material.dart';
import 'package:spotify_app/common/widgets/buttons/basic_button.dart';
import 'package:spotify_app/core/configs/assets/app.images.dart';
import 'package:spotify_app/core/configs/assets/app.vectors.dart';
import 'package:spotify_app/core/configs/theme/app.colors.dart';
import 'package:spotify_app/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImages.getstartedPhoto),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(40),
              color: Colors.black.withValues(alpha: 0.4),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(AppVectors.spotifyLogo),
                  ),
                  Spacer(),
                  Text(
                    'Enjoy Listening to Music',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 21),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: AppColors.textgray,
                    ),
                  ),
                  SizedBox(height: 21),
                  BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ChooseMode(),
                        ),
                      );
                    },
                    title: 'Get Started',
                  ),
                ],
              ),
            ),
            // child: Container(color: Colors.black.withValues(alpha: 0.4)),
          ),
        ],
      ),
    );
  }
}
