import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageSelectorDialog extends StatelessWidget {
  final Function? onLanguageChanged;
  
  const LanguageSelectorDialog({
    Key? key, 
    this.onLanguageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.orange.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'select_language'.tr(),
              style: GoogleFonts.lato(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade800,
              ),
            ),


            //ຫນ້ານີ້ແມ່ນເວລາກົດຫນ່ວຍໂລກແລ້ວສາມາດເລືອກພາສາໄດ້
            const SizedBox(height: 16),
            _buildLanguageOption(context, 'English', const Locale('en', 'US')),
            _buildLanguageOption(context, 'ไทย', const Locale('th', 'TH')),
            _buildLanguageOption(context, 'Español', const Locale('es', 'ES')),
            _buildLanguageOption(context, 'ລາວ', const Locale('lo', 'LA')),
            _buildLanguageOption(context, '한국어', const Locale('ko', 'KR')),

            //ຢາກໄດ້ພາສາໃດກະເພີ່ມໃສ່ ຢ່າລືມເພີ່ມ json ເດີ້ບໍ່ຊັ້ນລະ ຕຽມ error555+
            
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(BuildContext context, String language, Locale locale) {
    final isSelected = context.locale == locale;
    return GestureDetector(
      onTap: () {
        context.setLocale(locale);
        if (onLanguageChanged != null) {
          onLanguageChanged!();
        }
        Navigator.pop(context);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.orange.shade200,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
          border: Border.all(
            color: isSelected ? Colors.orange.shade700 : Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              language,
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.orange.shade800 : Colors.black87,
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle, color: Colors.orange.shade700),
          ],
        ),
      ),
    );
  }
}
