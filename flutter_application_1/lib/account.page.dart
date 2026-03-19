import 'package:flutter/material.dart';

class MyAccountPage extends StatelessWidget {
  static String path = '/account';

  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final info =
        // Obtiene los argumentos pasados a la ruta (datos del usuario)
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A2B4A),
        foregroundColor: Colors.white,
        title: const Text(
          'Mi Cuenta',
          style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Avatar + Nombre ──────────────────────────────────────────
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: const Color(0xFF1A2B4A),
                    child: Text(
                      _initials(info['name']),
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    info['name'] ?? 'N/A',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A2B4A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'CI: ${info['id'] ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ── Tarjeta de saldo ─────────────────────────────────────────
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1A2B4A), Color(0xFF2E4B82)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1A2B4A).withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Saldo disponible',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${info['CurrentBalance'] ?? '0.00'} Bs.',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _cardChip('N° Cuenta', info['accountNumber'] ?? 'N/A'),
                      _cardChip('Tarjeta', _maskCard(info['cardNumber'])),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ── Información personal ─────────────────────────────────────
            _sectionTitle('Información Personal'),
            const SizedBox(height: 12),
            _infoCard([
              _infoRow(
                Icons.cake_outlined,
                'Edad',
                '${info['age'] ?? 'N/A'} años',
              ),
              _divider(),
              _infoRow(
                Icons.location_city_outlined,
                'Dirección',
                info['address'] ?? 'N/A',
              ),
              if (info['phoneNumber'] != null) ...[
                _divider(),
                _infoRow(Icons.phone_outlined, 'Teléfono', info['phoneNumber']),
              ],
            ]),

            const SizedBox(height: 32),

            // ── Botón volver ─────────────────────────────────────────────
            SizedBox(
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_rounded, size: 20),
                label: const Text(
                  'Volver',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A2B4A),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // ── Helpers de UI ──────────────────────────────────────────────────────

  /// Título de sección
  Widget _sectionTitle(String title) => Text(
    title,
    style: const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w700,
      color: Color(0xFF8A9BB0),
      letterSpacing: 1.2,
    ),
  );

  /// Tarjeta blanca que envuelve filas de información
  Widget _infoCard(List<Widget> children) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(children: children),
  );

  /// Fila de información con ícono, etiqueta y valor
  Widget _infoRow(IconData icon, String label, String value) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    child: Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFF2E4B82)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF8A9BB0),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF1A2B4A),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  /// Divisor sutil entre filas
  Widget _divider() => const Divider(
    height: 1,
    indent: 48,
    endIndent: 16,
    color: Color(0xFFF0F2F5),
  );

  /// Chip de datos dentro de la tarjeta de saldo
  Widget _cardChip(String label, String value) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(color: Colors.white54, fontSize: 11)),
      const SizedBox(height: 3),
      Text(
        value,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
      ),
    ],
  );

  // ── Utilidades ─────────────────────────────────────────────────────────

  /// Devuelve las iniciales del nombre (ej: "Juan Pérez" → "JP")
  String _initials(dynamic name) {
    if (name == null || name.toString().trim().isEmpty) return '?';
    final parts = name.toString().trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts[0][0].toUpperCase();
  }

  /// Enmascara el número de tarjeta (ej: "1234567890123456" → "**** 3456")
  String _maskCard(dynamic cardNumber) {
    if (cardNumber == null) return 'N/A';
    final s = cardNumber.toString().replaceAll(' ', '');
    if (s.length < 4) return s;
    return '**** ${s.substring(s.length - 4)}';
  }
}
