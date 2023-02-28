import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class IntroCard extends StatelessWidget {
  const IntroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        color: const Color(0xFFF89300),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Hello, John Deer', style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
                    Text('How are you?', style: TextStyle(color: Colors.black, fontSize: 16.0,)),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network('https://scontent.fmkz1-1.fna.fbcdn.net/v/t1.6435-9/70709153_2517532095003772_5512531039118950400_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=N9TomPq4WHUAX-2iFJn&_nc_ht=scontent.fmkz1-1.fna&oh=00_AfAflMKxApklJE8PJ3TI1MlkfJiV0yJGPU7AxXSZshBPIA&oe=64259FDD')
              )
            ],
          ),
        ),
      ),
    );
  }
}