import 'package:flutter/material.dart';
import 'package:tcoreui/tcoreui.dart';

void main() {
  runApp(const TCoreUIExampleApp());
}

class TCoreUIExampleApp extends StatelessWidget {
  const TCoreUIExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TCoreUI Catalog',
      // 1. Integrasi Tema Global
      theme: TTheme.lightTheme,
      home: const CatalogScreen(),
    );
  }
}

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TCoreUI Components'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(TSpacing.lg),
        children: [
          // --- BAGIAN 1: TYPOGRAPHY ---
          _buildSectionTitle('Typography'),
          const Text('Heading 1', style: TTypography.heading1),
          const Text('Heading 2', style: TTypography.heading2),
          const Text('Heading 3', style: TTypography.heading3),
          const SizedBox(height: TSpacing.sm),
          const Text('Body Large - Teks untuk paragraf utama atau input.', style: TTypography.bodyLarge),
          const Text('Body Medium - Teks standar untuk deskripsi umum.', style: TTypography.bodyMedium),
          const Text('Body Small - Teks sekunder yang lebih kecil.', style: TTypography.bodySmall),

          const Divider(height: TSpacing.xxl),

          // --- BAGIAN 2: BUTTONS ---
          _buildSectionTitle('Buttons'),
          TButton(
            text: 'Primary Button',
            icon: Icons.save,
            onPressed: () => TSnackbar.show(context, message: 'Disimpan!', variant: TSnackbarVariant.success),
          ),
          const SizedBox(height: TSpacing.md),
          TButton(
            text: 'Outlined Button',
            variant: TButtonVariant.outlined,
            onPressed: () {},
          ),
          const SizedBox(height: TSpacing.md),
          TButton(
            text: 'Danger Button',
            variant: TButtonVariant.danger,
            onPressed: () {},
          ),
          const SizedBox(height: TSpacing.md),
          TButton(
            text: 'Loading State...',
            isLoading: true,
            onPressed: () {},
          ),

          const Divider(height: TSpacing.xxl),

          // --- BAGIAN 3: TEXT FIELDS ---
          _buildSectionTitle('Text Fields'),
          const TTextField(
            label: 'Nominal Pengeluaran',
            hintText: 'Misal: 50000',
            keyboardType: TextInputType.number,
            prefixIcon: Icon(Icons.attach_money, color: TColors.primary),
          ),
          const SizedBox(height: TSpacing.md),
          const TTextField(
            label: 'Catatan',
            hintText: 'Tulis deskripsi...',
            maxLines: 3,
          ),

          const Divider(height: TSpacing.xxl),

          // --- BAGIAN 4: CARDS ---
          _buildSectionTitle('Cards'),
          TCard(
            onTap: () => TSnackbar.show(context, message: 'Card ditekan!'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Makan Siang', style: TTypography.bodyLarge),
                Text('-Rp 25.000', style: TTypography.bodyLarge.copyWith(color: TColors.danger)),
              ],
            ),
          ),
          const SizedBox(height: TSpacing.md),
          TCard(
            backgroundColor: TColors.primary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total Saldo', style: TTypography.bodyMedium.copyWith(color: TColors.textInverse)),
                const SizedBox(height: TSpacing.sm),
                Text('Rp 1.500.000', style: TTypography.heading2.copyWith(color: TColors.textInverse)),
              ],
            ),
          ),

          const Divider(height: TSpacing.xxl),

          // --- BAGIAN 5: DIALOGS ---
          _buildSectionTitle('Dialogs (Modals)'),
          Row(
            children: [
              Expanded(
                child: TButton(
                  text: 'Success Dialog',
                  size: TButtonSize.small,
                  onPressed: () => TDialog.show(
                    context: context,
                    variant: TDialogVariant.success,
                    title: 'Berhasil',
                    description: 'Data telah disimpan.',
                    primaryButtonText: 'Tutup',
                    onPrimaryPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              const SizedBox(width: TSpacing.sm),
              Expanded(
                child: TButton(
                  text: 'Danger Dialog',
                  variant: TButtonVariant.danger,
                  size: TButtonSize.small,
                  onPressed: () => TDialog.show(
                    context: context,
                    variant: TDialogVariant.danger,
                    title: 'Hapus Data?',
                    description: 'Aksi ini tidak bisa dibatalkan.',
                    primaryButtonText: 'Hapus',
                    onPrimaryPressed: () => Navigator.pop(context),
                    secondaryButtonText: 'Batal',
                  ),
                ),
              ),
            ],
          ),

          const Divider(height: TSpacing.xxl),

          // --- BAGIAN 6: SHIMMER (LOADING KERANGKA) ---
          _buildSectionTitle('Shimmer Loading'),
          const TCard(
            child: Row(
              children: [
                TShimmer.circular(size: 40),
                SizedBox(width: TSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TShimmer(width: double.infinity, height: 16),
                      SizedBox(height: TSpacing.sm),
                      TShimmer(width: 100, height: 14),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: TSpacing.xxl),

          _buildSectionTitle(' Badge'),
          const TBadge(label: "Makanan")
        ],
      ),
    );
  }

  // Widget pembantu agar judul section seragam
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: TSpacing.md),
      child: Text(
        title,
        style: TTypography.heading2.copyWith(color: TColors.primary),
      ),
    );
  }
}