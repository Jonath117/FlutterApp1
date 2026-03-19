import 'package:flutter/material.dart';
import 'package:flutter_application_1/account.page.dart';
import 'package:flutter_application_1/commons/extensions.dart';

class HomePage extends StatefulWidget {
  static String path = '/';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState(); //crea el estado del widget, es decir, la parte que se va a actualizar cada vez que se cambie el estado del widget.
}

class _HomePageState extends State<HomePage> {
  double balance = 0.0;
  String chars = '*******';
  bool showBalance = true;
  bool isLoading = false;

  @override
  void initState() {
    balance = 21.00;
    super.initState();
  }

  Future<double> getBalance() async {
    await Future.delayed(Duration(seconds: 2));
    return 23.50;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mi Banca'),
          shape: Border(bottom: BorderSide(color: Colors.blueGrey, width: 0.5)),
        ),
        body: Center(
          child: Container(
            //color: Colors.blueGrey,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,

              spacing: 16,

              children: [
                SizedBox(height: 16, child: Container(color: Colors.red)),
                Text(
                  'Saldo:',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                isLoading
                    ? CircularProgressIndicator()
                    : Text('${showBalance ? balance : chars} Bs'),

                ElevatedButton(
                  onPressed: () {
                    showBalance = !showBalance;
                    setState(() {});
                    print(balance);
                  },
                  child: Text('${showBalance ? 'Ocultar' : 'Mostrar'} saldo'),
                ),

                ElevatedButton(
                  onPressed: () async {
                    isLoading = true;
                    setState(() {});
                    double newBalance = await getBalance();
                    balance = newBalance;
                    isLoading = false;
                    setState(() {});
                  },
                  child: Text('Actualizar saldo'),
                ),

                ElevatedButton(
                  onPressed: () async {
                    final info = {
                      'id': '13111372',
                      'name': 'Jonathan Enzo Rocha Contreras',
                      'accountNumber': '123456789',
                      'phoneNumber': '+591 75362417',
                      'age': 20,
                      'address': 'Calle Falsa 123',
                      'cardNumber': '1234 5678 9012 3456',
                      'CurrentBalance': balance,
                    };

                    //Navigator.pushNamed(context, MyAccountPage.path);
                    context.go(MyAccountPage.path, arguments: info);
                  },
                  child: Text('Mi cuenta'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
