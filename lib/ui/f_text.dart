import 'package:flutter/material.dart';

// ignore: camel_case_types
class fText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;

  /* ============================================
  ================== Heading ====================
  ============================================ */
  /// Extremely large text.
  fText.heading1(this.text,
      {Key? key, required context, this.textAlign = TextAlign.start})
      : style = Theme.of(context).textTheme.headline1,
        super(key: key);

  /// Very, very large text.
  /// Used for the date in the dialog shown by [showDatePicker].
  fText.heading2(this.text,
      {Key? key, required context, this.textAlign = TextAlign.start})
      : style = Theme.of(context).textTheme.headline2,
        super(key: key);

  /// Very large text.
  fText.heading3(this.text,
      {Key? key, required context, this.textAlign = TextAlign.start})
      : style = Theme.of(context).textTheme.headline3,
        super(key: key);

  /// Large text.
  fText.heading4(this.text,
      {Key? key, required context, this.textAlign = TextAlign.start})
      : style = Theme.of(context).textTheme.headline4,
        super(key: key);

  /// Used for large text in dialogs (e.g., the month and year in the dialog shown by [showDatePicker]).
  fText.heading5(this.text,
      {Key? key, required context, this.textAlign = TextAlign.start})
      : style = Theme.of(context).textTheme.headline5,
        super(key: key);

  /// Used for the primary text in app bars and dialogs (e.g., [AppBar.title] and [AlertDialog.title]).
  fText.heading6(this.text,
      {Key? key, required context, this.textAlign = TextAlign.start})
      : style = Theme.of(context).textTheme.headline6,
        super(key: key);

  /* ============================================
  ================== Subtitle ====================
  ============================================ */
  /// Used for the primary text in lists (e.g., [ListTile.title]).
  fText.subtitle1(this.text,
      {Key? key, required context, this.textAlign = TextAlign.start})
      : style = Theme.of(context).textTheme.subtitle1,
        super(key: key);

  /// For medium emphasis text that's a little smaller than [subtitle1].
  fText.subtitle2(this.text,
      {Key? key, required context, this.textAlign = TextAlign.start})
      : style = Theme.of(context).textTheme.subtitle2,
        super(key: key);

  /* ============================================
  ================== Body text ====================
  ============================================ */
  /// Used for emphasizing text that would otherwise be [bodyText2].
  fText.bodyText1(this.text,
      {Key? key, required context, this.textAlign = TextAlign.start})
      : style = Theme.of(context).textTheme.bodyText1,
        super(key: key);

  /// The default text style for [Material].
  fText.bodyText2(this.text,
      {Key? key, required context, this.textAlign = TextAlign.start})
      : style = Theme.of(context).textTheme.bodyText2,
        super(key: key);

  /* ============================================
  ================== Other ====================
  ============================================ */
  /// Used for auxiliary text associated with images.
  fText.caption(this.text,
      {Key? key, required context, this.textAlign = TextAlign.start})
      : style = Theme.of(context).textTheme.caption,
        super(key: key);

  /// Used for text on [ElevatedButton], [TextButton] and [OutlinedButton].
  fText.button(this.text,
      {Key? key, required context, this.textAlign = TextAlign.start})
      : style = Theme.of(context).textTheme.button,
        super(key: key);

  /// Used for text on [ElevatedButton], [TextButton] and [OutlinedButton].
  /// With custom TextStyle
  const fText.buttonStyled(this.text, TextStyle? _style,
      {Key? key, required context, this.textAlign = TextAlign.start})
      : style = _style,
        super(key: key);

  /// Text with custom style
  const fText.styled(this.text, TextStyle _style,
      {Key? key, this.textAlign = TextAlign.start})
      : style = _style,
        super(key: key);

  /// The smallest style.
  /// Typically used for captions or to introduce a (larger) headline.
  fText.overline(this.text,
      {Key? key, required context, this.textAlign = TextAlign.start})
      : style = Theme.of(context).textTheme.overline,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}
