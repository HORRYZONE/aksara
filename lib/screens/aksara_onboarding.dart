import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

class AksaraOnboarding extends StatefulWidget {
  const AksaraOnboarding({super.key});

  @override
  State<AksaraOnboarding> createState() => _AksaraOnboardingState();
}

class _AksaraOnboardingState extends State<AksaraOnboarding> {
  final PageController _controller = PageController();
  
  bool thirdPage = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.page == 2) {
        setState(() {
          thirdPage = true;
        });
      }
    });
  }

  void _goToNextPage() {
    _controller.animateToPage(_controller.page!.toInt() + 1,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 120),
        child: PageView(
          controller: _controller,
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 68, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFACE4FF), // background color
                            foregroundColor: Colors.white, // text color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20), // button border radius
                            ),
                            minimumSize: Size(67, 26), // button size
                          ),
                          child: Text('Skip'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 120),
                      child: Image.asset('assets/Welcome_1.png')),
                  Container(
                    margin: EdgeInsets.only(top: 45),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(),
                      child: Text(
                        'Boundless Communication',
                        style: TextStyle(
                          fontFamily: 'ConcertOne',
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 13),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 69,
                        maxWidth: 309,
                      ),
                      child: Text(
                        'Communicate comfortably with the aid of two ways sign language translator',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 68, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFACE4FF), // background color
                            foregroundColor: Colors.white, // text color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20), // button border radius
                            ),
                            minimumSize: Size(67, 26), // button size
                          ),
                          child: Text('Skip'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 120),
                      child: Image.asset('assets/Welcome_2.png')),
                  Container(
                    margin: EdgeInsets.only(top: 45),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(),
                      child: Text(
                        'Easy Learning',
                        style: TextStyle(
                          fontFamily: 'ConcertOne',
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 13),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 69,
                        maxWidth: 309,
                      ),
                      child: Text(
                        'Learn and improve your sign language skill with interactive learning session anytime and anywhere',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 220),
                      child: Image.asset('assets/Welcome_3.png')),
                  Container(
                    margin: EdgeInsets.only(top: 45),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(),
                      child: Text(
                        'Keep Connected',
                        style: TextStyle(
                          fontFamily: 'ConcertOne',
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 13),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 69,
                        maxWidth: 309,
                      ),
                      child: Text(
                        'Make new friends and interact virtually across the globe',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: 120,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColoredBox(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomIndicator(
                        netDragPercent: 0.5,
                        pagesLength: 3,
                        indicator: Indicator(
                            indicatorDesign: IndicatorDesign.line(
                                lineDesign: LineDesign(
                          lineType: DesignType.line_nonuniform,
                        ))))
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 343,
              child: thirdPage
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/auth/login');
                      },
                      child: const Text('Continue'))
                  : FloatingActionButton(
                      onPressed: _goToNextPage,
                      backgroundColor: const Color(0xFFFFA149),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        'NEXT',
                        textAlign: TextAlign.center,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}