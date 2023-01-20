import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  Function deleteTransaction;

  TransactionList(
      {Key? key,
      required this.userTransactions,
      required this.deleteTransaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constrains) {
            return Column(
              children: [
                Text(
                  'No Transactions Added Yet!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: constrains.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.contain,
                      )),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: userTransactions.length,
            itemBuilder: (context, index) {
              var tx = userTransactions[index];

              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: FittedBox(
                        child: CircleAvatar(
                      radius: 30,
                      child: Text(
                        '\$${tx.amount.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 15),
                      ),
                    )),
                  ),
                  title: Text(
                    tx.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(tx.date),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete'))
                      : IconButton(
                          icon: const Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          iconSize: 25,
                          onPressed: () {
                            deleteTransaction(tx.id);
                          },
                        ),
                ),
              );
            },
          );
  }
}
