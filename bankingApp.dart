import 'dart:io';
import 'package:dart_project1/bankSystemProject/basicBankSystem.dart';
import 'package:dart_project1/bankSystemProject/clientClass.dart';
import 'package:dart_project1/bankSystemProject/savingsBankAccount.dart';

class BankingApp {
  late List<BasicBankAccount> numOfAccounts;
  late List<Client> numOfClients;

  BankingApp() {
    numOfAccounts = [];
    numOfClients = [];
  }
  //
  // createTestData() {
  //   for (int i = 0; i < 10; i++) {
  //     Client client = Client('name$i', 'address$i', 'phoneNumber$i');
  //     BasicBankAccount basicBankAccount =
  //     BasicBankAccount(balance: (1000 * i).toDouble());
  //     client.account = basicBankAccount;
  //     basicBankAccount.owner = client;
  //     numOfAccounts.add(basicBankAccount);
  //     numOfClients.add(client);
  //   }
  // }

  viewMenue() {
    while (true) {
      print('''
    1-create a bank account
    2-list all the available bank accounts
    3-display the account details
    4-withdraw money
    5-deposit money
    6-delete account
    7-exit
    ''');
      int num = int.parse(stdin.readLineSync()!);
      switch (num) {
        case 1:
          createNewAccount();
          break;
        case 2:
          printAllData();
          break;
        case 3:
          printAccountDetails();
          break;
        case 4:
          withdraw();
          break;
        case 5:
          deposit();
          break;
        case 6:
          deleteAccount();
          break;
        case 7:
          print('Exit');
          return;

      }
    }
  }

  void createNewAccount() {
    print('enter your name:');
    String name = stdin.readLineSync()!;
    print('enter your address:');
    String address =stdin.readLineSync()!;
    print('enter your phone:');
    String phone = stdin.readLineSync()!;
    print('do you want to a saving account?(y/n):');
    bool savingAccount=(stdin.readLineSync()!)=='y'?true:false;
    print('enter the new balance:');
    double balance = double.parse(stdin.readLineSync()!);
    Client client = Client(name,address, phone);
    BasicBankAccount basicBankAccount =
    savingAccount==true?SavingsBankAccount(balance):
    BasicBankAccount(balance: balance);
    client.account = basicBankAccount;
    basicBankAccount.owner = client;
    numOfAccounts.add(basicBankAccount);
    numOfClients.add(client);
  }

  void printAllData() {
    for (var n in numOfAccounts) {
      n.viewAccountDetails();
      print('=========================================');
    }
  }

  int searchAccountIdGetIndex(int accountId) {
    for (int i = 0; i < numOfAccounts.length; i++) {
      if (numOfAccounts[i].accountId == accountId) {
        return i;
      }
    }
    return -1;
  }

  BasicBankAccount? searchAccountIdGetAccount(int accountId) {
    for (int i = 0; i < numOfAccounts.length; i++) {
      if (numOfAccounts[i].accountId == accountId) {
        return numOfAccounts[i];
      }
    }
    return null;
  }

  void printAccountDetails() {
    print('enter your id');
    int id = int.parse(stdin.readLineSync()!);
    BasicBankAccount? basicBankAccount = searchAccountIdGetAccount(id);
    if (basicBankAccount != null) {
      basicBankAccount.viewAccountDetails();
    } else {
      print('account not available');
    }
  }

  void withdraw() {
    print('enter your id:');
    int id = int.parse(stdin.readLineSync()!);
    print('enter your amount:');
    double amount = double.parse(stdin.readLineSync()!);
    BasicBankAccount? account = searchAccountIdGetAccount(id);
    if (account != null) {
      account.withDraw(amount);
    } else {
      print('account not available');
    }
  }

  void deposit() {
    print('enter your id:');
    int id = int.parse(stdin.readLineSync()!);
    print('enter your amount:');
    double amount = double.parse(stdin.readLineSync()!);
    BasicBankAccount? account = searchAccountIdGetAccount(id);
    if (account != null) {
      account.deposit(amount);
    } else {
      print('account not available');
    }
  }

  void deleteAccount() {
    print('enter your id:');
    int id = int.parse(stdin.readLineSync()!);
    int index = searchAccountIdGetIndex(id);
    if (index != -1) {
      numOfAccounts.removeAt(index);
      numOfClients.removeAt(index);
      print('account remove successfully');
    } else {
      print('account not available');
    }
  }
}

void main() {
  BankingApp bankingApp = BankingApp();
  // bankingApp.createTestData();
  bankingApp.viewMenue();
}
