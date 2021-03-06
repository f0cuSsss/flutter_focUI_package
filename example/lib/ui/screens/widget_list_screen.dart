import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:foc_ui/foc_ui.dart';

class WidgetListScreen extends StatefulWidget {
  const WidgetListScreen({Key? key}) : super(key: key);

  @override
  _WidgetListScreenState createState() => _WidgetListScreenState();
}

class _WidgetListScreenState extends State<WidgetListScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  bool hidePassword = true;

  bool checkboxValue1 = false;
  bool checkboxValue2 = false;

  bool switchValue1 = false;

  bool chipIsSelected = false;
  bool fruit1IsSelected = false;
  bool fruit2IsSelected = false;
  bool fruit3IsSelected = false;
  bool fruit4IsSelected = false;
  bool fruit5IsSelected = false;
  bool fruit6IsSelected = false;
  bool fruit7IsSelected = false;

  late fDropdownItem? dropdownSelectedItem;
  late List<fDropdownItem> dropdownItems;

  @override
  void initState() {
    super.initState();
    dropdownItems = [
      fDropdownItem.icon(
        id: 0,
        title: 'Add moderator',
        icon: const Icon(Icons.add_moderator),
      ),
      fDropdownItem.icon(
        id: 1,
        title: 'Security',
        icon: const Icon(Icons.security),
      ),
      fDropdownItem.icon(
        id: 2,
        title: 'Details',
        icon: const Icon(Icons.details),
      ),
      fDropdownItem(
        id: 2,
        title: 'Settings',
      ),
    ];
    // dropdownSelectedItem = null;
    dropdownSelectedItem = dropdownItems[0];
  }

  final _formKey = GlobalKey<FormState>();

  final _loginFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _btnFocus = FocusNode();

  void _submitFormHandler() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // ignore: avoid_print
      print('Login: ${_loginController.text}');
      // ignore: avoid_print
      print('Password: ${_passwordController.text}');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _loginController.dispose();
    _passwordController.dispose();
    _loginFocus.dispose();
    _passwordFocus.dispose();
    _btnFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Widgets example',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: [
                // Input fields
                Column(
                  children: [
                    fText.heading4('Input fields', context: context),
                    hSpaceSmall,
                    fInputField(
                      controller: _loginController,
                      placeholder: 'Login',
                      label: 'Login',
                      focusNode: _loginFocus,
                      onFieldSubmitted: (_) => fieldFocusChange(
                        context,
                        _loginFocus,
                        _passwordFocus,
                      ),
                      validatorCallback: (login) => validateLogin(login),
                    ),
                    hSpaceRegular,
                    fInputField(
                      controller: _passwordController,
                      placeholder: 'Password',
                      focusNode: _passwordFocus,
                      isPassword: hidePassword,
                      validatorCallback: (pass) => validatePassword(pass),
                      onFieldSubmitted: (_) => fieldFocusChange(
                        context,
                        _loginFocus,
                        _btnFocus,
                      ),
                      trailing: Icon(
                        hidePassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      trailingTapped: () => setState(
                        () => hidePassword = !hidePassword,
                      ),
                    ),
                  ],
                ),
                hSpaceMedium,
                const Divider(),
                hSpaceMedium,
                // Dropdown
                Column(
                  children: [
                    fText.heading4('Dropdown', context: context),
                    hSpaceSmall,
                    fDropdown(
                      selected: dropdownSelectedItem,
                      items: dropdownItems,
                      onChanged: (fDropdownItem selected) =>
                          setState(() => dropdownSelectedItem = selected),
                    ),
                  ],
                ),
                hSpaceMedium,
                const Divider(),
                // Buttons
                Column(
                  children: [
                    fText.heading4('Box buttons', context: context),
                    hSpaceSmall,
                    fBoxButton(
                      title: 'Submit',
                      focusNode: _btnFocus,
                      onTapped: _submitFormHandler,
                    ),
                    const Divider(),
                    hSpaceRegular,
                    fBoxButton(
                      title: 'Standart',
                      onTapped: () {},
                    ),
                    hSpaceRegular,
                    fBoxButton(
                      title: 'Outline',
                      outlineColor: Colors.amber,
                      outlineWidth: 2.0,
                      onTapped: () {},
                    ),
                    hSpaceRegular,
                    fBoxButton.outline(
                      title: 'Outline transparent',
                      outlineColor: Colors.black26,
                      onTapped: () {},
                      textStyle: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: Colors.black87),
                      isTransparent: true,
                    ),
                    hSpaceMedium,
                    fBoxButton(
                      title: 'Styled',
                      onTapped: () {},
                      textStyle: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: Colors.white, fontSize: 20),
                    ),
                    hSpaceMedium,
                    fBoxButton(
                      title: 'Disabled',
                      disabled: true,
                      onTapped: () {},
                    ),
                    hSpaceRegular,
                    const Divider(),
                    hSpaceRegular,
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: fGetPercentWidth(context, percentage: 12.0),
                        vertical: 0,
                      ),
                      child: fBoxButton(
                        title: 'Add Something',
                        height: 60,
                        elevation: 7,
                        onTapped: () {},
                        color: Colors.black,
                        textStyle: Theme.of(context).textTheme.button?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: fGetColorFromBackground(Colors.black),
                            ),
                      ),
                    ),
                    hSpaceRegular,
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: fGetPercentWidth(context, percentage: 12.0),
                        vertical: 0,
                      ),
                      child: fBoxButton(
                        title: 'Add Something [disabled]',
                        height: 60,
                        disabled: true,
                        elevation: 7,
                        onTapped: () {},
                        color: Colors.black,
                        textStyle: Theme.of(context).textTheme.button?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: fGetColorFromBackground(Colors.black),
                            ),
                      ),
                    ),
                    hSpaceRegular,
                    const Divider(),
                    hSpaceRegular,
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: fGetPercentWidth(context, percentage: 8.0),
                        vertical: 0,
                      ),
                      child: fBoxButton(
                        title: 'Add Something',
                        height: 70,
                        borderRadius: 18,
                        outlineColor: Colors.black.withOpacity(0.15),
                        elevation: 7,
                        onTapped: () {},
                        color: const Color(0xFF11DACC),
                        textStyle: Theme.of(context).textTheme.button?.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: fGetColorFromBackground(
                                  const Color(0xFF11DACC)),
                            ),
                      ),
                    ),
                    hSpaceRegular,
                    const Divider(),
                    fBoxButton(
                      title: 'With icon',
                      trailingIcon: const Icon(Icons.ac_unit),
                      leadingIcon: const Icon(Icons.add_alarm),
                      onTapped: () {},
                    ),
                    hSpaceRegular,
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: fGetPercentWidth(context, percentage: 20.0),
                        vertical: 0,
                      ),
                      child: fBoxButton(
                        title: 'Moderate',
                        height: 65,
                        leadingIcon: const Icon(Icons.add_moderator),
                        trailingIcon: const Icon(Icons.arrow_downward),
                        onTapped: () {},
                      ),
                    ),
                    hSpaceRegular,
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: fGetPercentWidth(context, percentage: 20.0),
                        vertical: 0,
                      ),
                      child: fBoxButton(
                        title: 'Send report',
                        height: 65,
                        leadingIcon: const Icon(Icons.send),
                        onTapped: () {},
                      ),
                    ),
                    hSpaceRegular,
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: fGetPercentWidth(context, percentage: 20.0),
                        vertical: 0,
                      ),
                      child: fBoxButton(
                        title: 'Send report',
                        height: 65,
                        trailingIcon: const Icon(Icons.send),
                        onTapped: () {},
                      ),
                    ),
                  ],
                ),
                hSpaceMedium,
                const Divider(),
                hSpaceMedium,
                // Menu buttons
                Column(
                  children: [
                    fText.heading4('Menu buttons', context: context),
                    hSpaceRegular,
                    fNeoMenuButton(
                      title: 'Profile',
                      icon: const Icon(
                        Icons.account_balance,
                        color: Colors.white,
                      ),
                      iconBackgroundColor: Colors.deepPurple,
                      onTapped: () {},
                    ),
                    hSpaceRegular,
                    fNeoMenuButton(
                      title: 'Home',
                      icon: const Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      iconBackgroundColor: Colors.deepPurple,
                      onTapped: () {},
                    ),
                    hSpaceRegular,
                    fNeoMenuButton(
                      title: 'Settings',
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      iconBackgroundColor: Colors.deepPurple,
                      onTapped: () {},
                    ),
                  ],
                ),
                hSpaceMedium,
                const Divider(),
                hSpaceMedium,
                // Oval buttons
                Column(
                  children: [
                    fText.heading4('Oval buttons', context: context),
                    hSpaceSmall,
                    fOvalButton(
                      title: 'Text',
                      onTapped: () {},
                    ),
                    hSpaceRegular,
                    fOvalButton(
                      title: 'T & I',
                      icon: const Icon(Icons.add_moderator),
                      textStyle: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                      ),
                      onTapped: () {},
                    ),
                    hSpaceRegular,
                    fOvalButton(
                      icon: const Icon(Icons.add_moderator),
                      onTapped: () {},
                    ),
                    hSpaceRegular,
                    fOvalButton(
                      onTapped: () {},
                    ),
                    hSpaceRegular,
                    fOvalButton(
                      size: 80,
                      icon: const Icon(
                        Icons.add_moderator,
                        size: 32,
                      ),
                      onTapped: () {},
                    ),
                  ],
                ),
                hSpaceMedium,
                const Divider(),
                // Chip buttons
                Column(
                  children: [
                    fText.heading4('Chip buttons', context: context),
                    hSpaceSmall,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          fChipButton(
                            title: 'Banana',
                            isSelected: fruit1IsSelected,
                            color: Colors.purpleAccent,
                            onSelect: (value) =>
                                setState(() => fruit1IsSelected = value),
                          ),
                          fChipButton(
                            title: 'Avocado',
                            isSelected: fruit2IsSelected,
                            color: Colors.purpleAccent,
                            onSelect: (value) =>
                                setState(() => fruit2IsSelected = value),
                          ),
                          fChipButton(
                            title: 'Grapefruit',
                            isSelected: fruit3IsSelected,
                            color: Colors.purpleAccent,
                            onSelect: (value) =>
                                setState(() => fruit3IsSelected = value),
                          ),
                          fChipButton(
                            title: 'Kiwi',
                            isSelected: fruit4IsSelected,
                            color: Colors.purpleAccent,
                            onSelect: (value) =>
                                setState(() => fruit4IsSelected = value),
                          ),
                          fChipButton(
                            title: 'Plum',
                            isSelected: fruit5IsSelected,
                            color: Colors.purpleAccent,
                            onSelect: (value) =>
                                setState(() => fruit5IsSelected = value),
                          ),
                          fChipButton(
                            title: 'Peach',
                            isSelected: fruit6IsSelected,
                            color: Colors.purpleAccent,
                            onSelect: (value) =>
                                setState(() => fruit6IsSelected = value),
                          ),
                          fChipButton(
                            title: 'Tangerine',
                            isSelected: fruit7IsSelected,
                            color: Colors.purpleAccent,
                            onSelect: (value) =>
                                setState(() => fruit7IsSelected = value),
                          ),
                        ],
                      ),
                    ),
                    hSpaceSmall,
                    fChipInputButton(
                      title: 'Chip input',
                      isSelected: chipIsSelected,
                      onSelect: (value) =>
                          setState(() => chipIsSelected = value),
                    ),
                  ],
                ),
                hSpaceMedium,
                const Divider(),
                // Text
                Column(
                  children: [
                    fText.heading4('Text', context: context),
                    hSpaceSmall,
                    fText.heading1('Heading 1', context: context),
                    fText.heading2('Heading 2', context: context),
                    fText.heading3('Heading 3', context: context),
                    fText.heading4('Heading 4', context: context),
                    fText.heading5('Heading 5', context: context),
                    fText.heading6('Heading 6', context: context),
                    hSpaceRegular,
                    fText.bodyText1('Body text 1', context: context),
                    fText.bodyText2('Body text 2', context: context),
                    hSpaceRegular,
                    fText.subtitle1('Subtitle 1', context: context),
                    fText.subtitle2('Subtitle 2', context: context),
                    hSpaceRegular,
                    fText.caption('Caption', context: context),
                    fText.overline('Overline', context: context),
                    fText.button('Button', context: context),
                    const fText.styled(
                      'Styled text',
                      TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                hSpaceMedium,
                const Divider(),
                // Checkboxes
                Column(
                  children: [
                    fText.heading4('Checkboxes', context: context),
                    hSpaceSmall,
                    fCheckbox(
                      title: 'Click to check me :) [don\'t clickable text]',
                      selectedColor: Colors.purpleAccent,
                      selected: checkboxValue1,
                      checkHandler: (value) {
                        setState(() => checkboxValue1 = value!);
                      },
                    ),
                    hSpaceRegular,
                    fCheckbox(
                      title: 'Click to check me :) [clickable text]',
                      selectedColor: Colors.purpleAccent,
                      selected: checkboxValue2,
                      clickable: true,
                      checkHandler: (value) {
                        setState(() => checkboxValue2 = value!);
                      },
                    ),
                  ],
                ),
                hSpaceMedium,
                const Divider(),
                Column(
                  children: [
                    fText.heading4('Switcher', context: context),
                    hSpaceSmall,
                    fSwitch(
                      title: 'Switch me :)',
                      value: switchValue1,
                      onChanged: (val) => setState(() => switchValue1 = val),
                      selectedColor: Colors.purpleAccent,
                    ),
                  ],
                ),

                hSpaceMedium,
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
