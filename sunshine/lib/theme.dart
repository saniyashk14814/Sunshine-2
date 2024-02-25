import 'utils.dart';

class AppColors {
  static const Color primary = Color(0xFFFFC800);
  static const Color primaryvariant = Color(0xFFF8ECC3);
  static const Color blue = Color(0xFF2D7DD2);
  static const Color black = Color(0xFF09192A);
  static const Color grey = Color(0xFF899199);
  static const Color background = Color(0xFFFDFAEF);
  static const Color white = Color(0xFFEEF5FB);
  static const Color green = Color(0xFF306B34);
  static const Color greenbg = Color(0xFFEEF3EF);
}

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final Color bgcolor;
  final double fontsize;
  final FontWeight fontweight;


  const MyButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.color,
      required this.bgcolor,
      required this.fontsize,
      required this.fontweight,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,

      child: Container(
        width: 370  ,
        padding:  const EdgeInsets.symmetric( vertical: 8),
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(60),
        ),
        child: Text(
          text,
          style: GoogleFonts.outfit(
            color: color,
            fontSize: fontsize,
            fontWeight: fontweight,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final String hintText;

  const MyTextField({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.white,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1,
          ),
        ),
        hintText: 'Your Name',
        hintStyle: GoogleFonts.outfit(
          color: AppColors.grey,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.none,
        ),
        contentPadding: const EdgeInsets.all(18),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final int pageno;
  const PageIndicator({super.key, required this.pageno});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 4,
            width: 120,
            decoration: BoxDecoration(
              color: pageno == 1 ? AppColors.black : Colors.black12,
              borderRadius: BorderRadius.circular(60),
            ),
          ),
          Container(
            height: 4,
            width: 120,
            decoration: BoxDecoration(
              color: pageno == 2 ? AppColors.black : Colors.black12,
              borderRadius: BorderRadius.circular(60),
            ),
          ),
          Container(
            height: 4,
            width: 120,
            decoration: BoxDecoration(
              color: pageno == 3 ? AppColors.black : Colors.black12,
              borderRadius: BorderRadius.circular(60),
            ),
          ),
        ],
      ),
    );
  }
}

class MoodCard extends StatelessWidget {
  final String mood;
  final Color color;
  const MoodCard({super.key, required this.mood, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: color,
            width: 2,
          ),
        );
      },
      child: Container(
        width: 120,
        height: 120,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Color(color.value).withOpacity(0.4),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/$mood.png', height: 60, width: 60),
            const SizedBox(height: 2),
            Text(
              mood,
              style: GoogleFonts.outfit(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CauseCard extends StatelessWidget {
  final String cause;
  const CauseCard({super.key, required this.cause});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: AppColors.primaryvariant,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Text(
          cause,
          style: GoogleFonts.outfit(
            color: AppColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none,
          ),
        ));
  }
}
