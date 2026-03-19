import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/account/domain/entities/account.entity.dart';
import 'package:flutter_application_1/features/account/presentation/widgets/item_info.widget.dart';

class MyAccountPage extends StatelessWidget {
  static String path = '/account';
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    //sirve para obtener los argumentos que se le pasaron a la ruta, en este caso, el nombre del usuario.
    final info =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final account = info['account'] as AccountEntity;

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
              'Titular: ${account.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),

            Text(
              'Carnet: ${account.id}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),

            Text(
              'Edad: ${account.age} años',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),

            Text(
              'Cuenta: ${account.accountNumber}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              'Saldo: ${account.currentBalance} bs',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),

            ItemInfo(
              icon: Icons.credit_card,
              text: 'Numero de Tarjeta: ${account.cardNumber}',
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),

            // Row(
            //   mainAxisAlignment: .center,
            //   children: [
            //     Icon(Icons.credit_card),
            //     Text(
            //       'Numero de Tarjeta: ${account.cardNumber}',
            //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            //     ),
            //   ],
            // ),
            ItemInfo(
              icon: Icons.location_city,
              text: account.address,
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),

            // Row(
            //   mainAxisAlignment: .center,
            //   children: [
            //     Icon(Icons.location_city),
            //     Text(
            //       account.address,
            //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            //     ),
            //   ],
            // ),/
            if (info['phoneNumber'] != null)
              ItemInfo(
                icon: Icons.location_city,
                text: account.phoneNumber,
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
