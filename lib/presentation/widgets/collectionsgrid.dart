import 'package:flutter/material.dart';

class CollectionGrid extends StatefulWidget {
  const CollectionGrid({Key? key}) : super(key: key);

  @override
  State<CollectionGrid> createState() => _CollectionGridState();
}

class _CollectionGridState extends State<CollectionGrid> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        scrollDirection: Axis.vertical,
        children: List.generate(
            4,
            (index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFFD9D9D9),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "Collection ${index + 1} ",
                          style: const TextStyle(
                            color: Color(0xFF4A4A4A),
                            fontSize: 17,
                            fontFamily: 'Helvetica Neue',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.34,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          " $index items",
                          style: const TextStyle(
                            color: Color(0xFF4A4A4A),
                            fontSize: 14,
                            fontFamily: 'Helvetica Neue',
                            fontWeight: FontWeight.w300,
                            height: 0,
                            letterSpacing: 0.28,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
