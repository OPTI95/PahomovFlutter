import 'package:flutter/material.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 230,
              width: double.infinity,
              child: Card(
                color: Color.fromRGBO(242, 201, 76, 1),
                child: Image(image: AssetImage("images/image6.png")),
              ),
            ),
            Text(
              "Peter Mach",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
            ),
            Text(
              "Mind Deep Relax",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            Text(
              "Join the Community as we prepare over 33 days to relax and feel joy with the mind and happnies session across the World.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(3, 158, 162, 1))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Play Next Session",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ListTitleWidget(
                title: "Sweet Memories",
                caption: "December 29 Pre-Launch",
                color: Color.fromRGBO(47, 128, 237, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ListTitleWidget(
                title: "A Day Dream",
                caption: "December 29 Pre-Launch",
                color: Color.fromRGBO(3, 158, 162, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ListTitleWidget(
                title: "Mind Explore",
                caption: "December 29 Pre-Launch",
                color: Color.fromRGBO(240, 146, 53, 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListTitleWidget extends StatelessWidget {
  final String title;
  final String caption;
  final Color color;
  const ListTitleWidget({
    super.key,
    required this.title,
    required this.caption,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 42,
            height: 42,
            child: Card(
              color: color,
              child: Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
              ),
            )),
        SizedBox(
          width: 13,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
            ),
            Text(
              caption,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
            ),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  shape: BoxShape.circle),
            ),
            SizedBox(
              width: 2,
            ),
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  shape: BoxShape.circle),
            ),
            SizedBox(
              width: 2,
            ),
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  shape: BoxShape.circle),
            ),
          ],
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
