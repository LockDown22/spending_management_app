import 'package:flutter/material.dart';
class NewTransaction  extends StatelessWidget {

  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);
  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty||enteredAmount<=0){
      return;
    }
     addTx(titleController.text,
                       double.parse(amountController.text) 
                       );
  }
  @override
  Widget build(BuildContext context) {
    return Card(
              elevation: 3,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      controller: titleController,
                      onSubmitted: (_)=> submitData(),
                      // onChanged: (val){
                      //   titleInput = val;
                      // } ,
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      onSubmitted: (_)=> submitData(),
                      // onChanged: (val){
                      //   amountInput = val;
                      // },
                      decoration: InputDecoration(labelText: 'Amount'),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      child: Text('Add Transaction'),
                      onPressed: submitData,
                    ),
                  ],
                ),
              ),
            );
  }
} 