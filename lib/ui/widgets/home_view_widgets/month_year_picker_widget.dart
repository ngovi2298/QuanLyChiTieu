import 'package:flutter/material.dart';
import 'package:Expenses_Tracker_App/core/viewmodels/home_model.dart';

class PickMonthOverlay extends StatelessWidget {
  final HomeModel model;
  final BuildContext context;

  const PickMonthOverlay({Key key, this.model, this.context})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 50.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: model.months.length,
          itemBuilder: (Context, i) {
            return Container(
              child: InkWell(
                onTap: () {
                  model.monthClicked(model.months[i]);
                  },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Center(
                          child: Text(
                              model.months[i].toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.0),
                          )),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
