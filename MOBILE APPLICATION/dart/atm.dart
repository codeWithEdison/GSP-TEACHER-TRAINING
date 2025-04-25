import 'dart:io';

void main() {
  double balance = 0.0;
  String choice = '';

  while (choice != '4') {
    print('1. Deposit');
    print('2. Withdraw');
    print('3. Check Balance');
    print('4. Exit');
    print('Enter your choice:');
    choice = stdin.readLineSync() ?? '';

    if (choice == '1') {
      print('Enter amount to deposit:');
      double? amount = double.tryParse(stdin.readLineSync()!);
      if (amount != null && amount > 0) {
        balance += amount;
        print('Deposited: $amount');
      } else {
        print('Invalid amount.');
      }
    } else if (choice == '2') {
      print('Enter amount to withdraw:');
      double? amount = double.tryParse(stdin.readLineSync()!);
      if (amount != null && amount > 0 && amount <= balance) {
        balance -= amount;
        print('Withdrawn: $amount');
      } else {
        print('Invalid or insufficient funds.');
      }
    } else if (choice == '3') {
      print('Balance: $balance');
    } else if (choice == '4') {
      print('Goodbye.');
    } else {
      print('Invalid option.');
    }

    print(''); // Blank line for spacing
  }
}


