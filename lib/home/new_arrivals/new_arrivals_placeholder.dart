import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewArrivalsPlaceholder extends StatelessWidget {
  const NewArrivalsPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getPlaceholders();
  }

  Widget getPlaceholders() {
    List<Widget> list = new List.filled(4, Placeholder());
    return Row(children: list);
  }
}

class Placeholder extends StatelessWidget {
  const Placeholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: <Widget>[
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor:
                Colors.grey.shade100,
                enabled: true,
                child: Column(
                  children: [0]
                      .map((_) => Padding(
                    padding:
                    const EdgeInsets
                        .only(
                        bottom:
                        8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 132.0,
                          height: 150,
                          color: Colors
                              .white,
                        ),
                      ],
                    ),
                  ))
                      .toList(),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child: Column(
                  children: [0].map((_) => Padding(
                    padding: EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 122.0,
                          height: 10,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )).toList(),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor:
                Colors.grey.shade100,
                enabled: true,
                child: Column(
                  children: [0]
                      .map((_) => Padding(
                    padding:
                    const EdgeInsets
                        .only(
                        top: 10.0,
                        left:
                        5.0),
                    child: Row(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: [
                        Container(
                          width: 50.0,
                          height: 10,
                          color: Colors
                              .white,
                        ),
                      ],
                    ),
                  ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

