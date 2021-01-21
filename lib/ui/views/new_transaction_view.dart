import 'package:flutter/material.dart';
import 'package:Expenses_Tracker_App/core/viewmodels/new_transcation_model.dart';
import 'package:Expenses_Tracker_App/ui/shared/ui_helpers.dart';
import 'package:Expenses_Tracker_App/ui/views/base_view.dart';
import 'package:Expenses_Tracker_App/ui/widgets/new_transaction_view_widget/transaction_type_spinner.dart';

class NewTransactionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<NewTransactionModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: TransactionTypeSpinner(
              model.selectedCategory, model.changeSelectedItem),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              //crossAxisCount: 3,
              //childAspectRatio: 1.2,
              children: model
                  .loadCategoriesIcons()
                  .map((e) => Card(
                      elevation: 4,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("inserttransaction",
                              arguments: [e, model.selectedCategory]);
                        },
                        child: Container(
                          padding: EdgeInsets.all(4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              UIHelper.verticalSpaceSmall(),
                              CircleAvatar(
                                radius: 30,
                                child: Center(
                                  child: Icon(
                                    e.icon,
                                    size: 25,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  e.name,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
