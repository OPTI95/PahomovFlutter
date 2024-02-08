import 'package:flutter/material.dart';

class MeditatePage extends StatelessWidget {
  List<String> categories = [
    "All",
    "Bibie in Year",
    "Dailies",
    "Minutes",
    "Noven"
  ];
  MeditatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Meditate",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(
              Icons.search,
              size: 36,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 5,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: index == 0
                          ? const MaterialStatePropertyAll(
                              Color.fromRGBO(3, 158, 162, 1),
                            )
                          : const MaterialStatePropertyAll(
                              Color.fromRGBO(230, 254, 255, 1),
                            ),
                    ),
                    onPressed: () {},
                    child: index == 0
                        ? Text(
                            categories[index],
                            style: const TextStyle(color: Colors.white),
                          )
                        : Text(
                            categories[index],
                            style: const TextStyle(
                                color: Color.fromRGBO(3, 158, 162, 1)),
                          ));
              },
            ),
          ),
          const Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: CardWidget(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: SmallCardWidget(
                          text: "The Sleep Hour",
                          type: "Sessions",
                          count: "3",
                          caption: "Ashna Mukherjee",
                          color: Color.fromRGBO(240, 146, 53, 1),
                          imageName: 'image3',
                        )),
                        Expanded(
                            child: SmallCardWidget(
                          text: "Easy on the Mission",
                          type: "minutes",
                          count: "5",
                          caption: "Peter Mach",
                          color: Color.fromRGBO(242, 201, 76, 1),
                          imageName: 'image4',
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: SmallCardWidget(
                          color: Color.fromRGBO(47, 128, 237, 1),
                          text: "Relax with Me",
                          type: "Sessions",
                          count: "3",
                          caption: "Amanda James",
                          imageName: 'image5',
                        )),
                        Expanded(
                            child: SmallCardWidget(
                          color: Color.fromRGBO(3, 158, 162, 1),
                          text: "Sun and Energy",
                          type: "minutes",
                          count: "5",
                          caption: "Micheal Hiu",
                          imageName: 'image3',
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 180,
          width: double.infinity,
          child: Card(
            color: Color.fromRGBO(242, 201, 76, 1),
            child: Image(image: AssetImage("images/image2.png")),
          ),
        ),
        Card(
          color: Colors.white,
          elevation: 0.3,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "A Song of Moon",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text(
                  "Start with the basics",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 0),
                  child: Row(
                    children: [
                      Icon(Icons.favorite_border),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "9 Sessions",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                      Spacer(),
                      Text(
                        "Start",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                      Icon(Icons.keyboard_arrow_right_outlined)
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class SmallCardWidget extends StatelessWidget {
  final String text;
  final String caption;
  final String count;
  final String type;
  final String imageName;
  final Color color;
  const SmallCardWidget({
    super.key,
    required this.text,
    required this.caption,
    required this.count,
    required this.type,
    required this.imageName,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Card(
              color: color,
              child: Image(image: AssetImage("images/$imageName.png"), fit: BoxFit.scaleDown),
            ),
          ),
          Card(
            color: Colors.white,
            elevation: 0.3,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    caption,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.favorite_border,
                          size: 10,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "$count $type",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        ),
                        const Spacer(),
                        const Text(
                          "Start",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right_outlined,
                          size: 12,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
