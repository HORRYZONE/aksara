import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const double _navbarHeight = 50;

class AksaraNavigationBar extends StatelessWidget {
  const AksaraNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 20,
      left: 0,
      child: SizedBox(
        width: size.width,
        child: Stack(children: [
          Container(
            alignment: Alignment.center,
            width: size.width,
            height: 70,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(size.width, _navbarHeight),
                  painter: LeftPainter(),
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              width: 70,
              height: 70,
              child: FloatingActionButton(
                splashColor: const Color(0xFFF89300),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70 / 2)),
                onPressed: () {},
                backgroundColor: const Color(0xFFFFC727),
                child:
                    SvgPicture.string(fabSvgString, width: 28, height: 28),
              ),
            ),
          ),
          SizedBox(
            width: size.width,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () {}, splashColor: const Color(0xFFF89300), icon: const Icon(Icons.home_outlined, color: Colors.white,)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.school_outlined, color: Colors.white,)),
                Container(width: size.width * 0.15,),
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined, color: Colors.white,)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.person_outline, color: Colors.white,)),
              ],
            ),
          ) 
        ]),
      ),
    );
  }
}

const String fabSvgString = '''
<svg width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M18.6 27.6C18.6 22.56 20.34 18.3 23.82 14.82C27.3 11.34 31.56 9.6 36.6 9.6V13.2C32.56 13.2 29.15 14.59 26.37 17.37C23.59 20.15 22.2 23.56 22.2 27.6H18.6ZM25.8 27.6C25.8 24.6 26.853 22.05 28.959 19.95C31.065 17.85 33.612 16.8 36.6 16.8V20.4C34.6 20.4 32.9 21.1 31.5 22.5C30.1 23.9 29.4 25.6 29.4 27.6H25.8ZM6.59736 9C5.35912 9 4.3 8.55912 3.42 7.67736C2.54 6.79556 2.1 5.73556 2.1 4.49736C2.1 3.25912 2.54088 2.2 3.42264 1.32C4.30444 0.44 5.36444 0 6.60264 0C7.84088 0 8.9 0.44088 9.78 1.32264C10.66 2.20444 11.1 3.26444 11.1 4.50264C11.1 5.74088 10.6591 6.8 9.77736 7.68C8.89556 8.56 7.83556 9 6.59736 9ZM0 20.7V15.3C0 14.4667 0.3 13.7583 0.9 13.175C1.5 12.5917 2.2 12.3 3 12.3H10.2C12.12 12.3 13.76 11.74 15.12 10.62C16.48 9.5 17.36 8.06 17.76 6.3H21.42C21.1 8.46 20.19 10.36 18.69 12C17.19 13.64 15.36 14.8067 13.2 15.5V20.7H0ZM41.3974 36.3C40.1591 36.3 39.1 35.8591 38.22 34.9774C37.34 34.0956 36.9 33.0356 36.9 31.7974C36.9 30.5591 37.3409 29.5 38.2226 28.62C39.1044 27.74 40.1644 27.3 41.4026 27.3C42.6409 27.3 43.7 27.7409 44.58 28.6226C45.46 29.5044 45.9 30.5644 45.9 31.8026C45.9 33.0409 45.4591 34.1 44.5774 34.98C43.6956 35.86 42.6356 36.3 41.3974 36.3ZM34.8 48V42.8C32.64 42.1067 30.81 40.94 29.31 39.3C27.81 37.66 26.9 35.76 26.58 33.6H30.24C30.64 35.36 31.52 36.8 32.88 37.92C34.24 39.04 35.88 39.6 37.8 39.6H45C45.8333 39.6 46.5417 39.8917 47.125 40.475C47.7083 41.0583 48 41.7667 48 42.6V48H34.8Z" fill="black"/>
</svg>
''';

class LeftPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double firstXPos = (size.height / 2) + 10;
    final double firstWidth = size.width * 0.2;
    final double secondXPos = firstWidth + 6;
    final double secondXWidth = secondXPos + (size.width * 0.2);
    final double thirdXPos = secondXWidth + 60;
    final double thirdWidth = thirdXPos + (size.width * 0.2);
    final double fourthXPos = thirdWidth + 6;
    final double fourthWidth = size.width - (size.height / 2) - 10;

    Paint paint = Paint()
      ..color = const Color(0xFFF89300)
      ..style = PaintingStyle.fill;

    Path path1 = Path();
    path1.moveTo(firstXPos, size.height);
    path1.arcToPoint(Offset(firstXPos, 0),
        radius: const Radius.circular(5.0), clockwise: true);
    path1.lineTo(firstWidth, 0);
    path1.lineTo(firstWidth, size.height);
    path1.close();

    Path path2 = Path();
    path2.moveTo(secondXPos, size.height);
    path2.lineTo(secondXPos, 0);
    path2.lineTo(secondXPos + (size.width * 0.2 - 16), 0);
    path2.quadraticBezierTo(secondXPos + (size.width * 0.2 - 8), 0,
        secondXPos + (size.width * 0.2) - 4, 6);
    path2.arcToPoint(
        Offset(secondXPos + (size.width * 0.2 - 4), size.height - 6),
        radius: const Radius.circular((_navbarHeight / 2) + 12),
        clockwise: false);
    path2.quadraticBezierTo(secondXPos + (size.width * 0.2 - 8), size.height,
        secondXPos + (size.width * 0.2) - 16, size.height);
    path2.lineTo(size.width * 0.2 - 7, size.height);
    path2.close();

    Path path3 = Path();
    path3.moveTo(thirdWidth, size.height);
    path3.lineTo(thirdWidth, 0);
    path3.lineTo(thirdXPos + 16, 0);
    path3.quadraticBezierTo(thirdXPos + 8, 0, thirdXPos + 4, 6);
    path3.arcToPoint(Offset(thirdXPos + 4, size.height - 6),
        radius: const Radius.circular((_navbarHeight / 2) + 12),
        clockwise: true);
    path3.quadraticBezierTo(
        thirdXPos + 8, size.height, thirdXPos + 16, size.height);
    path3.lineTo(thirdWidth + 16, size.height);
    path3.close();

    Path path4 = Path();
    path4.moveTo(fourthWidth, size.height);
    path4.arcToPoint(Offset(fourthWidth, 0),
        radius: const Radius.circular(5.0), clockwise: false);
    path4.lineTo(fourthXPos, 0);
    path4.lineTo(fourthXPos, size.height);
    path4.close();

    canvas.drawPath(path1, paint);
    canvas.drawPath(path2, paint);
    canvas.drawPath(path3, paint);
    canvas.drawPath(path4, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class LeftMidPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFFF89300)
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, 0);
    path.lineTo(size.width * 0.2 - 12, 0);
    path.quadraticBezierTo(size.width * 0.2 - 5, 0, size.width * 0.2, 8);
    path.arcToPoint(Offset(size.width * 0.2, size.height - 8),
        radius: const Radius.circular((_navbarHeight / 2) + 4),
        clockwise: false);
    path.quadraticBezierTo(
        size.width * 0.2 - 5, size.height, size.width * 0.2 - 12, size.height);
    path.lineTo(size.width * 0.2 - 7, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class RightMidPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFFF89300)
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, 0);
    path.lineTo(size.width * 0.2 - 12, 0);
    path.quadraticBezierTo(size.width * 0.2 - 5, 0, size.width * 0.2, 8);
    path.arcToPoint(Offset(size.width * 0.2, size.height - 8),
        radius: const Radius.circular((_navbarHeight / 2) + 4),
        clockwise: false);
    path.quadraticBezierTo(
        size.width * 0.2 - 5, size.height, size.width * 0.2 - 12, size.height);
    path.lineTo(size.width * 0.2 - 7, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
