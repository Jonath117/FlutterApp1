import 'package:flutter/material.dart';

class MyAccountPage extends StatefulWidget {
  static String path = '/account';

  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  bool showData = true;
  final String chars = '*******';
  final String cardChars = '**** **** **** ****';

  @override
  Widget build(BuildContext context) {
    final info =
        //sirve para obtener los argumentos que se le pasaron a la ruta, en este caso, el nombre del usuario.
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Cuenta'),
        shape: Border(bottom: BorderSide(color: Colors.blueGrey, width: 0.5)),
      ),
      body: Center(
        child: Column(
          spacing: 16,

          children: [
            SizedBox(height: 16, child: Container()),
            Center(
              child: Text(
                'Mis Datos',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            Text(
              'Titular: ${info['name'] ?? 'N/A'}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),

            Text(
              'Carnet: ${info['id'] ?? 'N/A'}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),

            Text(
              'Edad: ${info['age'] ?? 'N/A'} años',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),

            Text(
              'Cuenta: ${showData ? info['accountNumber'] ?? 'N/A' : chars}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              'Saldo: ${showData ? info['CurrentBalance'] ?? 'N/A' : chars} bs',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),

            Row(
              mainAxisAlignment: .center,
              children: [
                Icon(Icons.credit_card),
                Text(
                  'Numero de Tarjeta: ${showData ? info['cardNumber'] ?? 'N/A' : cardChars}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: .center,
              children: [
                Icon(Icons.location_city),
                Text(
                  info['address'] ?? 'N/A',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),

            if (info['phoneNumber'] != null)
              Row(
                mainAxisAlignment: .center,
                children: [
                  Icon(Icons.phone),
                  Text(
                    info['phoneNumber'] ?? 'N/A',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  showData = !showData;
                });
              },
              child: Text(
                '${showData ? 'Ocultar' : 'Mostrar'} datos sensibles',
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}
