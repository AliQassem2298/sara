// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `This field is required`
  String get This_field_is_required {
    return Intl.message(
      'This field is required',
      name: 'This_field_is_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an valid email address`
  String get Please_enter_an_valid_email_address {
    return Intl.message(
      'Please enter an valid email address',
      name: 'Please_enter_an_valid_email_address',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get email {
    return Intl.message(
      'email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `The password must be more than 8.`
  String get The_password_must_be_more_than_8 {
    return Intl.message(
      'The password must be more than 8.',
      name: 'The_password_must_be_more_than_8',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Hi`
  String get Hi {
    return Intl.message(
      'Hi',
      name: 'Hi',
      desc: '',
      args: [],
    );
  }

  /// `User logged in successfully`
  String get User_logged_in_successfully {
    return Intl.message(
      'User logged in successfully',
      name: 'User_logged_in_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Sorry`
  String get Sorry {
    return Intl.message(
      'Sorry',
      name: 'Sorry',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get Dont_have_an_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'Dont_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `REGISTER`
  String get REGISTER {
    return Intl.message(
      'REGISTER',
      name: 'REGISTER',
      desc: '',
      args: [],
    );
  }

  /// `FirstName`
  String get FirstName {
    return Intl.message(
      'FirstName',
      name: 'FirstName',
      desc: '',
      args: [],
    );
  }

  /// `LastName`
  String get LastName {
    return Intl.message(
      'LastName',
      name: 'LastName',
      desc: '',
      args: [],
    );
  }

  /// `You have to enter right number.`
  String get You_have_to_enter_right_number {
    return Intl.message(
      'You have to enter right number.',
      name: 'You_have_to_enter_right_number',
      desc: '',
      args: [],
    );
  }

  /// `WELCOME_SIGN_UP`
  String get WELCOME_SIGN_UP {
    return Intl.message(
      'WELCOME_SIGN_UP',
      name: 'WELCOME_SIGN_UP',
      desc: '',
      args: [],
    );
  }

  /// `YourNamber`
  String get YourNamber {
    return Intl.message(
      'YourNamber',
      name: 'YourNamber',
      desc: '',
      args: [],
    );
  }

  /// `UserName`
  String get UserName {
    return Intl.message(
      'UserName',
      name: 'UserName',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get Location {
    return Intl.message(
      'Location',
      name: 'Location',
      desc: '',
      args: [],
    );
  }

  /// `Passwords didn't match`
  String get Passwords_didnt_match {
    return Intl.message(
      'Passwords didn\'t match',
      name: 'Passwords_didnt_match',
      desc: '',
      args: [],
    );
  }

  /// `ConfirmYourPassword`
  String get ConfirmYourPassword {
    return Intl.message(
      'ConfirmYourPassword',
      name: 'ConfirmYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get Sign_Up {
    return Intl.message(
      'Sign Up',
      name: 'Sign_Up',
      desc: '',
      args: [],
    );
  }

  /// `User created successfully`
  String get User_created_successfully {
    return Intl.message(
      'User created successfully',
      name: 'User_created_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Have account?`
  String get Have_account {
    return Intl.message(
      'Have account?',
      name: 'Have_account',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get Orders {
    return Intl.message(
      'Orders',
      name: 'Orders',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get Cart {
    return Intl.message(
      'Cart',
      name: 'Cart',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get Loading {
    return Intl.message(
      'Loading...',
      name: 'Loading',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get Error {
    return Intl.message(
      'Error',
      name: 'Error',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load profile`
  String get Failed_to_load_profile {
    return Intl.message(
      'Failed to load profile',
      name: 'Failed_to_load_profile',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get No_Data {
    return Intl.message(
      'No Data',
      name: 'No_Data',
      desc: '',
      args: [],
    );
  }

  /// `No profile data available`
  String get No_profile_data_available {
    return Intl.message(
      'No profile data available',
      name: 'No_profile_data_available',
      desc: '',
      args: [],
    );
  }

  /// `User Successfully logged out`
  String get User_Successfully_logged_out {
    return Intl.message(
      'User Successfully logged out',
      name: 'User_Successfully_logged_out',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `Failed_to_load_stores`
  String get Failed_to_load_stores {
    return Intl.message(
      'Failed_to_load_stores',
      name: 'Failed_to_load_stores',
      desc: '',
      args: [],
    );
  }

  /// `new trend`
  String get new_trend {
    return Intl.message(
      'new trend',
      name: 'new_trend',
      desc: '',
      args: [],
    );
  }

  /// `Stores`
  String get Stores {
    return Intl.message(
      'Stores',
      name: 'Stores',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get Products {
    return Intl.message(
      'Products',
      name: 'Products',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load products.`
  String get Failed_to_load_products {
    return Intl.message(
      'Failed to load products.',
      name: 'Failed_to_load_products',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get Product_Details {
    return Intl.message(
      'Product Details',
      name: 'Product_Details',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get Price {
    return Intl.message(
      'Price',
      name: 'Price',
      desc: '',
      args: [],
    );
  }

  /// `Quantity want`
  String get Quantity_want {
    return Intl.message(
      'Quantity want',
      name: 'Quantity_want',
      desc: '',
      args: [],
    );
  }

  /// `In preparation`
  String get In_preparation {
    return Intl.message(
      'In preparation',
      name: 'In_preparation',
      desc: '',
      args: [],
    );
  }

  /// `Product added to cart successfully`
  String get Product_added_to_cart_successfully {
    return Intl.message(
      'Product added to cart successfully',
      name: 'Product_added_to_cart_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get Add_to_Cart {
    return Intl.message(
      'Add to Cart',
      name: 'Add_to_Cart',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get Success {
    return Intl.message(
      'Success',
      name: 'Success',
      desc: '',
      args: [],
    );
  }

  /// `Image uploaded successfully`
  String get Image_uploaded_successfully {
    return Intl.message(
      'Image uploaded successfully',
      name: 'Image_uploaded_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Failed to upload image`
  String get Failedtouploadimage {
    return Intl.message(
      'Failed to upload image',
      name: 'Failedtouploadimage',
      desc: '',
      args: [],
    );
  }

  /// `No data available`
  String get Nodataavailable {
    return Intl.message(
      'No data available',
      name: 'Nodataavailable',
      desc: '',
      args: [],
    );
  }

  /// `first name`
  String get firstname {
    return Intl.message(
      'first name',
      name: 'firstname',
      desc: '',
      args: [],
    );
  }

  /// `last name`
  String get lastname {
    return Intl.message(
      'last name',
      name: 'lastname',
      desc: '',
      args: [],
    );
  }

  /// `user name`
  String get username {
    return Intl.message(
      'user name',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `phone number`
  String get phonenumber {
    return Intl.message(
      'phone number',
      name: 'phonenumber',
      desc: '',
      args: [],
    );
  }

  /// `Update Adress`
  String get UpdateAdress {
    return Intl.message(
      'Update Adress',
      name: 'UpdateAdress',
      desc: '',
      args: [],
    );
  }

  /// `Location updated successfully`
  String get Locationupdatedsuccessfully {
    return Intl.message(
      'Location updated successfully',
      name: 'Locationupdatedsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Save Adress`
  String get SaveAdress {
    return Intl.message(
      'Save Adress',
      name: 'SaveAdress',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get Editprofile {
    return Intl.message(
      'Edit profile',
      name: 'Editprofile',
      desc: '',
      args: [],
    );
  }

  /// `Information updated successfully`
  String get Informationupdatedsuccessfully {
    return Intl.message(
      'Information updated successfully',
      name: 'Informationupdatedsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Save changes`
  String get Savechanges {
    return Intl.message(
      'Save changes',
      name: 'Savechanges',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get MyOrders {
    return Intl.message(
      'My Orders',
      name: 'MyOrders',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while fetching data`
  String get Anerroroccurredwhilefetchingdata {
    return Intl.message(
      'An error occurred while fetching data',
      name: 'Anerroroccurredwhilefetchingdata',
      desc: '',
      args: [],
    );
  }

  /// `There are no requests to display`
  String get Therearenorequeststodisplay {
    return Intl.message(
      'There are no requests to display',
      name: 'Therearenorequeststodisplay',
      desc: '',
      args: [],
    );
  }

  /// `The Order`
  String get TheOrder {
    return Intl.message(
      'The Order',
      name: 'TheOrder',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get TotalPrice {
    return Intl.message(
      'Total Price',
      name: 'TotalPrice',
      desc: '',
      args: [],
    );
  }

  /// `Order Date`
  String get OrderDate {
    return Intl.message(
      'Order Date',
      name: 'OrderDate',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get Status {
    return Intl.message(
      'Status',
      name: 'Status',
      desc: '',
      args: [],
    );
  }

  /// `Order cancelled successfully`
  String get Ordercancelledsuccessfully {
    return Intl.message(
      'Order cancelled successfully',
      name: 'Ordercancelledsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Confirmed`
  String get Confirmed {
    return Intl.message(
      'Confirmed',
      name: 'Confirmed',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get Canceled {
    return Intl.message(
      'Canceled',
      name: 'Canceled',
      desc: '',
      args: [],
    );
  }

  /// `unknown`
  String get unknown {
    return Intl.message(
      'unknown',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `Error fetching orders`
  String get Errorfetchingorders {
    return Intl.message(
      'Error fetching orders',
      name: 'Errorfetchingorders',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get MyCart {
    return Intl.message(
      'My Cart',
      name: 'MyCart',
      desc: '',
      args: [],
    );
  }

  /// `No data found`
  String get Nodatafound {
    return Intl.message(
      'No data found',
      name: 'Nodatafound',
      desc: '',
      args: [],
    );
  }

  /// `Error loading Products`
  String get ErrorloadingProducts {
    return Intl.message(
      'Error loading Products',
      name: 'ErrorloadingProducts',
      desc: '',
      args: [],
    );
  }

  /// `There is no product in cart`
  String get Thereisnoproductincart {
    return Intl.message(
      'There is no product in cart',
      name: 'Thereisnoproductincart',
      desc: '',
      args: [],
    );
  }

  /// `Quantity exceeds available stock.`
  String get Quantityexceedsavailablestock {
    return Intl.message(
      'Quantity exceeds available stock.',
      name: 'Quantityexceedsavailablestock',
      desc: '',
      args: [],
    );
  }

  /// `Quantity updated successfully`
  String get Quantityupdatedsuccessfully {
    return Intl.message(
      'Quantity updated successfully',
      name: 'Quantityupdatedsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Order has been canceled successfully`
  String get Orderhasbeencanceledsuccessfully {
    return Intl.message(
      'Order has been canceled successfully',
      name: 'Orderhasbeencanceledsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Order`
  String get ConfirmOrder {
    return Intl.message(
      'Confirm Order',
      name: 'ConfirmOrder',
      desc: '',
      args: [],
    );
  }

  /// `Total available`
  String get Totalavailable {
    return Intl.message(
      'Total available',
      name: 'Totalavailable',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get Quantity {
    return Intl.message(
      'Quantity',
      name: 'Quantity',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Search by`
  String get Searchby {
    return Intl.message(
      'Search by',
      name: 'Searchby',
      desc: '',
      args: [],
    );
  }

  /// `product`
  String get product {
    return Intl.message(
      'product',
      name: 'product',
      desc: '',
      args: [],
    );
  }

  /// `store`
  String get store {
    return Intl.message(
      'store',
      name: 'store',
      desc: '',
      args: [],
    );
  }

  /// `There are no products with this name`
  String get Therearenoproductswiththisname {
    return Intl.message(
      'There are no products with this name',
      name: 'Therearenoproductswiththisname',
      desc: '',
      args: [],
    );
  }

  /// `There are no stores with this name`
  String get Therearenostoreswiththisname {
    return Intl.message(
      'There are no stores with this name',
      name: 'Therearenostoreswiththisname',
      desc: '',
      args: [],
    );
  }

  /// `No Address`
  String get NoAddress {
    return Intl.message(
      'No Address',
      name: 'NoAddress',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
