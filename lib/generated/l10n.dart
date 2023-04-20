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

  /// `MaanStore`
  String get storeTitle {
    return Intl.message(
      'MaanStore',
      name: 'storeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get saveButton {
    return Intl.message(
      'Save',
      name: 'saveButton',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get orders {
    return Intl.message(
      'Order',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `MaanStore Fashion`
  String get storeName {
    return Intl.message(
      'MaanStore Fashion',
      name: 'storeName',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Show All`
  String get showAll {
    return Intl.message(
      'Show All',
      name: 'showAll',
      desc: '',
      args: [],
    );
  }

  /// `Special Offers`
  String get specialOffer {
    return Intl.message(
      'Special Offers',
      name: 'specialOffer',
      desc: '',
      args: [],
    );
  }

  /// `Closing In`
  String get closingTime {
    return Intl.message(
      'Closing In',
      name: 'closingTime',
      desc: '',
      args: [],
    );
  }

  /// `Closing In`
  String get endTime {
    return Intl.message(
      'Closing In',
      name: 'endTime',
      desc: '',
      args: [],
    );
  }

  /// `Trending Fashion`
  String get trendingFashion {
    return Intl.message(
      'Trending Fashion',
      name: 'trendingFashion',
      desc: '',
      args: [],
    );
  }

  /// `New Arrivals`
  String get newArrival {
    return Intl.message(
      'New Arrivals',
      name: 'newArrival',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skipText {
    return Intl.message(
      'Skip',
      name: 'skipText',
      desc: '',
      args: [],
    );
  }

  /// `Start Your Journey with`
  String get authScreenWelcomeText {
    return Intl.message(
      'Start Your Journey with',
      name: 'authScreenWelcomeText',
      desc: '',
      args: [],
    );
  }

  /// `You will find great products and tools for your needs. We are 100% conscious of quality assurance. Thank you`
  String get authScreenSubTitle {
    return Intl.message(
      'You will find great products and tools for your needs. We are 100% conscious of quality assurance. Thank you',
      name: 'authScreenSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get registerButtonText {
    return Intl.message(
      'Register',
      name: 'registerButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signInButtonText {
    return Intl.message(
      'Sign In',
      name: 'signInButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get textFieldEmailLabelText {
    return Intl.message(
      'Email',
      name: 'textFieldEmailLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Your Email address`
  String get textFieldEmailHintText {
    return Intl.message(
      'Please enter Your Email address',
      name: 'textFieldEmailHintText',
      desc: '',
      args: [],
    );
  }

  /// `Email cannot be empty`
  String get textFieldEmailValidatorText1 {
    return Intl.message(
      'Email cannot be empty',
      name: 'textFieldEmailValidatorText1',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get textFieldEmailValidatorText2 {
    return Intl.message(
      'Please enter a valid email address',
      name: 'textFieldEmailValidatorText2',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get textFieldPassLabelText {
    return Intl.message(
      'Password',
      name: 'textFieldPassLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a password`
  String get textFieldPassHintText {
    return Intl.message(
      'Please enter a password',
      name: 'textFieldPassHintText',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get textFieldPassValidatorText1 {
    return Intl.message(
      'Password cannot be empty',
      name: 'textFieldPassValidatorText1',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a bigger password`
  String get textFieldPassValidatorText2 {
    return Intl.message(
      'Please enter a bigger password',
      name: 'textFieldPassValidatorText2',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message(
      'Remember me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgetPass {
    return Intl.message(
      'Forgot Password',
      name: 'forgetPass',
      desc: '',
      args: [],
    );
  }

  /// `Signing In...`
  String get easyLoadingSignIn {
    return Intl.message(
      'Signing In...',
      name: 'easyLoadingSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Successful`
  String get easyLoadingSuccess {
    return Intl.message(
      'Successful',
      name: 'easyLoadingSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed with Error`
  String get easyLoadingError {
    return Intl.message(
      'Failed with Error',
      name: 'easyLoadingError',
      desc: '',
      args: [],
    );
  }

  /// `Not a member?`
  String get notMember {
    return Intl.message(
      'Not a member?',
      name: 'notMember',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get textFieldUserNameLabelText {
    return Intl.message(
      'Username',
      name: 'textFieldUserNameLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Your Username`
  String get textFieldUserNameHintText {
    return Intl.message(
      'Please enter Your Username',
      name: 'textFieldUserNameHintText',
      desc: '',
      args: [],
    );
  }

  /// `Username cannot be empty`
  String get textFieldUserNameValidatorText1 {
    return Intl.message(
      'Username cannot be empty',
      name: 'textFieldUserNameValidatorText1',
      desc: '',
      args: [],
    );
  }

  /// `Please input at least 4 character`
  String get textFieldUserNameValidatorText2 {
    return Intl.message(
      'Please input at least 4 character',
      name: 'textFieldUserNameValidatorText2',
      desc: '',
      args: [],
    );
  }

  /// `Registering....`
  String get easyLoadingRegister {
    return Intl.message(
      'Registering....',
      name: 'easyLoadingRegister',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cartScreenName {
    return Intl.message(
      'Cart',
      name: 'cartScreenName',
      desc: '',
      args: [],
    );
  }

  /// `items`
  String get cartItems {
    return Intl.message(
      'items',
      name: 'cartItems',
      desc: '',
      args: [],
    );
  }

  /// `No Items in the cart, Please Shop Now`
  String get ifNoItems {
    return Intl.message(
      'No Items in the cart, Please Shop Now',
      name: 'ifNoItems',
      desc: '',
      args: [],
    );
  }

  /// `No Items in the cart, Please Shop Now`
  String get coupon {
    return Intl.message(
      'No Items in the cart, Please Shop Now',
      name: 'coupon',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a Coupon`
  String get enterCoupon {
    return Intl.message(
      'Please enter a Coupon',
      name: 'enterCoupon',
      desc: '',
      args: [],
    );
  }

  /// `Applying....`
  String get easyLoadingApplying {
    return Intl.message(
      'Applying....',
      name: 'easyLoadingApplying',
      desc: '',
      args: [],
    );
  }

  /// `Applied`
  String get easyLoadingSuccessApplied {
    return Intl.message(
      'Applied',
      name: 'easyLoadingSuccessApplied',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get couponApply {
    return Intl.message(
      'Apply',
      name: 'couponApply',
      desc: '',
      args: [],
    );
  }

  /// `Your Order`
  String get yourOrder {
    return Intl.message(
      'Your Order',
      name: 'yourOrder',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get discount {
    return Intl.message(
      'Discount',
      name: 'discount',
      desc: '',
      args: [],
    );
  }

  /// `Total Amount`
  String get totalAmount {
    return Intl.message(
      'Total Amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Check Out`
  String get checkOutButton {
    return Intl.message(
      'Check Out',
      name: 'checkOutButton',
      desc: '',
      args: [],
    );
  }

  /// `Please add some products first`
  String get addProductFirst {
    return Intl.message(
      'Please add some products first',
      name: 'addProductFirst',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address`
  String get addNewAddressScreenName {
    return Intl.message(
      'Add New Address',
      name: 'addNewAddressScreenName',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get fastNameTextFieldLabel {
    return Intl.message(
      'First Name',
      name: 'fastNameTextFieldLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your first name`
  String get fastNameTextFieldHint {
    return Intl.message(
      'Enter your first name',
      name: 'fastNameTextFieldHint',
      desc: '',
      args: [],
    );
  }

  /// `First name cannot be empty`
  String get fastNameTextFieldValidator {
    return Intl.message(
      'First name cannot be empty',
      name: 'fastNameTextFieldValidator',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastNameTextFieldLabel {
    return Intl.message(
      'Last Name',
      name: 'lastNameTextFieldLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your last name`
  String get lastNameTextFieldHint {
    return Intl.message(
      'Enter your last name',
      name: 'lastNameTextFieldHint',
      desc: '',
      args: [],
    );
  }

  /// `Last name cannot be empty`
  String get lastNameTextFieldValidator {
    return Intl.message(
      'Last name cannot be empty',
      name: 'lastNameTextFieldValidator',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address 1`
  String get strAddress1Text {
    return Intl.message(
      'Add New Address 1',
      name: 'strAddress1Text',
      desc: '',
      args: [],
    );
  }

  /// `Enter Street address`
  String get strAddress1TextHint {
    return Intl.message(
      'Enter Street address',
      name: 'strAddress1TextHint',
      desc: '',
      args: [],
    );
  }

  /// `Street address cannot be empty`
  String get strAddress1TextValid {
    return Intl.message(
      'Street address cannot be empty',
      name: 'strAddress1TextValid',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address 2`
  String get strAddress2Text {
    return Intl.message(
      'Add New Address 2',
      name: 'strAddress2Text',
      desc: '',
      args: [],
    );
  }

  /// `Town / City*`
  String get cityTown {
    return Intl.message(
      'Town / City*',
      name: 'cityTown',
      desc: '',
      args: [],
    );
  }

  /// `Enter Town / City`
  String get cityTownHint {
    return Intl.message(
      'Enter Town / City',
      name: 'cityTownHint',
      desc: '',
      args: [],
    );
  }

  /// `Town / City cannot be empty`
  String get cityTownValid {
    return Intl.message(
      'Town / City cannot be empty',
      name: 'cityTownValid',
      desc: '',
      args: [],
    );
  }

  /// `Postcode*`
  String get postcode {
    return Intl.message(
      'Postcode*',
      name: 'postcode',
      desc: '',
      args: [],
    );
  }

  /// `Enter a postcode`
  String get postcodeHint {
    return Intl.message(
      'Enter a postcode',
      name: 'postcodeHint',
      desc: '',
      args: [],
    );
  }

  /// `Postcode cannot be empty`
  String get postcodeValid {
    return Intl.message(
      'Postcode cannot be empty',
      name: 'postcodeValid',
      desc: '',
      args: [],
    );
  }

  /// `State*`
  String get state {
    return Intl.message(
      'State*',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `Enter a State`
  String get stateHint {
    return Intl.message(
      'Enter a State',
      name: 'stateHint',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get textFieldPhoneLabel {
    return Intl.message(
      'Phone Number',
      name: 'textFieldPhoneLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Phone Number`
  String get textFieldPhoneHint {
    return Intl.message(
      'Enter Your Phone Number',
      name: 'textFieldPhoneHint',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number cannot be empty`
  String get textFieldPhoneValidator {
    return Intl.message(
      'Phone Number cannot be empty',
      name: 'textFieldPhoneValidator',
      desc: '',
      args: [],
    );
  }

  /// `Updating...`
  String get updateHint {
    return Intl.message(
      'Updating...',
      name: 'updateHint',
      desc: '',
      args: [],
    );
  }

  /// `Check Out`
  String get checkOutScreenName {
    return Intl.message(
      'Check Out',
      name: 'checkOutScreenName',
      desc: '',
      args: [],
    );
  }

  /// `Please add shipping Address First`
  String get addShippingAddressButton {
    return Intl.message(
      'Please add shipping Address First',
      name: 'addShippingAddressButton',
      desc: '',
      args: [],
    );
  }

  /// `Total Items:`
  String get totalItems {
    return Intl.message(
      'Total Items:',
      name: 'totalItems',
      desc: '',
      args: [],
    );
  }

  /// `Quantity:`
  String get quantity {
    return Intl.message(
      'Quantity:',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Address`
  String get shippingAddress {
    return Intl.message(
      'Shipping Address',
      name: 'shippingAddress',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get changeButton {
    return Intl.message(
      'Change',
      name: 'changeButton',
      desc: '',
      args: [],
    );
  }

  /// `Proceed to Checkout`
  String get payWithWebCheckoutButton {
    return Intl.message(
      'Proceed to Checkout',
      name: 'payWithWebCheckoutButton',
      desc: '',
      args: [],
    );
  }

  /// `Creating Order...`
  String get easyLoadingCreatingOrder {
    return Intl.message(
      'Creating Order...',
      name: 'easyLoadingCreatingOrder',
      desc: '',
      args: [],
    );
  }

  /// `Order successfully!`
  String get orderSuccess {
    return Intl.message(
      'Order successfully!',
      name: 'orderSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Your order will be delivered soon. Thank you.`
  String get orderSuccessSubText {
    return Intl.message(
      'Your order will be delivered soon. Thank you.',
      name: 'orderSuccessSubText',
      desc: '',
      args: [],
    );
  }

  /// `Back to Home`
  String get backToHomeButton {
    return Intl.message(
      'Back to Home',
      name: 'backToHomeButton',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Your Order`
  String get confirmOrderScreenName {
    return Intl.message(
      'Confirm Your Order',
      name: 'confirmOrderScreenName',
      desc: '',
      args: [],
    );
  }

  /// `My Order`
  String get myOrderScreenName {
    return Intl.message(
      'My Order',
      name: 'myOrderScreenName',
      desc: '',
      args: [],
    );
  }

  /// `Order ID: #`
  String get orderId {
    return Intl.message(
      'Order ID: #',
      name: 'orderId',
      desc: '',
      args: [],
    );
  }

  /// `You have no order`
  String get noOrder {
    return Intl.message(
      'You have no order',
      name: 'noOrder',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Order`
  String get cancelOrderButton {
    return Intl.message(
      'Cancel Order',
      name: 'cancelOrderButton',
      desc: '',
      args: [],
    );
  }

  /// `Canceling Order`
  String get cancelingOrder {
    return Intl.message(
      'Canceling Order',
      name: 'cancelingOrder',
      desc: '',
      args: [],
    );
  }

  /// `Enter reason for cancel order`
  String get cancelingOrderHintText {
    return Intl.message(
      'Enter reason for cancel order',
      name: 'cancelingOrderHintText',
      desc: '',
      args: [],
    );
  }

  /// `Canceling order....`
  String get easyLoadingCancelingOrder {
    return Intl.message(
      'Canceling order....',
      name: 'easyLoadingCancelingOrder',
      desc: '',
      args: [],
    );
  }

  /// `(22 Review)`
  String get totalReview {
    return Intl.message(
      '(22 Review)',
      name: 'totalReview',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Show more`
  String get showMore {
    return Intl.message(
      'Show more',
      name: 'showMore',
      desc: '',
      args: [],
    );
  }

  /// `Show less`
  String get showLess {
    return Intl.message(
      'Show less',
      name: 'showLess',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get review {
    return Intl.message(
      'Reviews',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `No reviews`
  String get noReview {
    return Intl.message(
      'No reviews',
      name: 'noReview',
      desc: '',
      args: [],
    );
  }

  /// `Write a review`
  String get writeReview {
    return Intl.message(
      'Write a review',
      name: 'writeReview',
      desc: '',
      args: [],
    );
  }

  /// `Delivery & Services`
  String get deliveryAndSer {
    return Intl.message(
      'Delivery & Services',
      name: 'deliveryAndSer',
      desc: '',
      args: [],
    );
  }

  /// `Free Delivery`
  String get freeDelivery {
    return Intl.message(
      'Free Delivery',
      name: 'freeDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Pay on delivery available`
  String get payOnDelivery {
    return Intl.message(
      'Pay on delivery available',
      name: 'payOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Easy 30 days return & exchange available`
  String get returnDay {
    return Intl.message(
      'Easy 30 days return & exchange available',
      name: 'returnDay',
      desc: '',
      args: [],
    );
  }

  /// `Related Products`
  String get relatedProducts {
    return Intl.message(
      'Related Products',
      name: 'relatedProducts',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now`
  String get buyNowButton {
    return Intl.message(
      'Buy Now',
      name: 'buyNowButton',
      desc: '',
      args: [],
    );
  }

  /// `Go to Cart`
  String get goToCartButton {
    return Intl.message(
      'Go to Cart',
      name: 'goToCartButton',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get addToCartButton {
    return Intl.message(
      'Add to Cart',
      name: 'addToCartButton',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get myProfileScreenName {
    return Intl.message(
      'Edit Profile',
      name: 'myProfileScreenName',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get updateProfileButton {
    return Intl.message(
      'Update Profile',
      name: 'updateProfileButton',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profileScreenName {
    return Intl.message(
      'Profile',
      name: 'profileScreenName',
      desc: '',
      args: [],
    );
  }

  /// `Search Product`
  String get searchProduct {
    return Intl.message(
      'Search Product',
      name: 'searchProduct',
      desc: '',
      args: [],
    );
  }

  /// `Recent Searches`
  String get recentSearches {
    return Intl.message(
      'Recent Searches',
      name: 'recentSearches',
      desc: '',
      args: [],
    );
  }

  /// `Clear all`
  String get clearAllButton {
    return Intl.message(
      'Clear all',
      name: 'clearAllButton',
      desc: '',
      args: [],
    );
  }

  /// `No items found`
  String get noItemsFound {
    return Intl.message(
      'No items found',
      name: 'noItemsFound',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Opinion`
  String get ratingText {
    return Intl.message(
      'Enter Your Opinion',
      name: 'ratingText',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get massage {
    return Intl.message(
      'Message',
      name: 'massage',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all inputs`
  String get ratingError {
    return Intl.message(
      'Please fill all inputs',
      name: 'ratingError',
      desc: '',
      args: [],
    );
  }

  /// `Haven’t Purchased this Product?`
  String get haveNotPurchased {
    return Intl.message(
      'Haven’t Purchased this Product?',
      name: 'haveNotPurchased',
      desc: '',
      args: [],
    );
  }

  /// `you can\'t write a review until purchase this product`
  String get haveNotPurchased2 {
    return Intl.message(
      'you can\\\'t write a review until purchase this product',
      name: 'haveNotPurchased2',
      desc: '',
      args: [],
    );
  }

  /// `Continue Shopping`
  String get continueShopping {
    return Intl.message(
      'Continue Shopping',
      name: 'continueShopping',
      desc: '',
      args: [],
    );
  }

  /// `Total Reviews: `
  String get totalReviews {
    return Intl.message(
      'Total Reviews: ',
      name: 'totalReviews',
      desc: '',
      args: [],
    );
  }

  /// `Maanstore WooCommerce`
  String get splashScreenOneAppName {
    return Intl.message(
      'Maanstore WooCommerce',
      name: 'splashScreenOneAppName',
      desc: '',
      args: [],
    );
  }

  /// `Version 1.0.2`
  String get splashScreenOneAppVersion {
    return Intl.message(
      'Version 1.0.2',
      name: 'splashScreenOneAppVersion',
      desc: '',
      args: [],
    );
  }

  /// `Or sign in with`
  String get otherSignIn {
    return Intl.message(
      'Or sign in with',
      name: 'otherSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get orderDetailsScreenName {
    return Intl.message(
      'Order Details',
      name: 'orderDetailsScreenName',
      desc: '',
      args: [],
    );
  }

  /// `Price:`
  String get price {
    return Intl.message(
      'Price:',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Pay Now`
  String get payNowButton {
    return Intl.message(
      'Pay Now',
      name: 'payNowButton',
      desc: '',
      args: [],
    );
  }

  /// `Go to Home`
  String get goToHomeButton {
    return Intl.message(
      'Go to Home',
      name: 'goToHomeButton',
      desc: '',
      args: [],
    );
  }

  /// `Phone:`
  String get phone {
    return Intl.message(
      'Phone:',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Maanstore`
  String get splashScreenTwoHeadlines1 {
    return Intl.message(
      'Welcome to Maanstore',
      name: 'splashScreenTwoHeadlines1',
      desc: '',
      args: [],
    );
  }

  /// `It’s Simple For You`
  String get splashScreenTwoHeadlines2 {
    return Intl.message(
      'It’s Simple For You',
      name: 'splashScreenTwoHeadlines2',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your Best Product`
  String get splashScreenTwoHeadlines3 {
    return Intl.message(
      'Choose Your Best Product',
      name: 'splashScreenTwoHeadlines3',
      desc: '',
      args: [],
    );
  }

  /// `You will find great products and tools for your needs. We are 100% conscious of quality assurance. Thank you`
  String get splashScreenTwoSubTitles1 {
    return Intl.message(
      'You will find great products and tools for your needs. We are 100% conscious of quality assurance. Thank you',
      name: 'splashScreenTwoSubTitles1',
      desc: '',
      args: [],
    );
  }

  /// `You will find great products and tools for your needs. We are 100% conscious of quality assurance. Thank you`
  String get splashScreenTwoSubTitles2 {
    return Intl.message(
      'You will find great products and tools for your needs. We are 100% conscious of quality assurance. Thank you',
      name: 'splashScreenTwoSubTitles2',
      desc: '',
      args: [],
    );
  }

  /// `You will find great products and tools for your needs. We are 100% conscious of quality assurance. Thank you`
  String get splashScreenTwoSubTitles3 {
    return Intl.message(
      'You will find great products and tools for your needs. We are 100% conscious of quality assurance. Thank you',
      name: 'splashScreenTwoSubTitles3',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
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
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ro'),
      Locale.fromSubtags(languageCode: 'tr'),
      Locale.fromSubtags(languageCode: 'zh'),
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
