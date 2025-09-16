import 'package:flutter/material.dart';
import 'package:owala_app/data/onboarding_data.dart';
import 'package:owala_app/utils/consts.dart';
import 'package:owala_app/views/onboarding/components/boarding_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
int curruntPage = 0;
final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  // maksud dari kode ini untuk memberi tahu untuk 
                  //setiap kli ada perubahan di satu object/halaman 
                  //yang di trigger oleh adanya interaksi oleh pengguna
                  setState(() {
                    curruntPage = value;
                  });
                },
                itemCount: onBoardingData.length,
                itemBuilder:(context, index) => OnboardingContent(
                  text: onBoardingData[index].text,
                  image: onBoardingData[index].image,
                ) ,
              ),
            ),
            Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
               onBoardingData.length,
               (index) =>  _dotsIndicator(index: index )
              )
            )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor
                  ),
                  onPressed: () {
                    if (curruntPage == onBoardingData.length -1) {
                      Navigator.pushNamed(context, '/login');
                    } else {
                      _pageController.animateToPage(
                        curruntPage + 1,
                        duration: animationDuration,
                        curve: Curves.ease
                      );
                    }
                  },
                  child: Text(
                    //curruntpage == 3(karna ngambil dari list) - 1 ?
                    curruntPage == onBoardingData.length - 1 ? "Get Started" : "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        )
        ),
    );
  }

  AnimatedContainer _dotsIndicator({required int index}) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: curruntPage == index ? primaryColor : secondaryColor
      ),
      width: curruntPage == index ? 20: 7,
      height:5,
      duration: animationDuration,
    );

  }
}