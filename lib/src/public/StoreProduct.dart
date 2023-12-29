import 'package:superwallkit_flutter/src/public/Product.dart';

/// A wrapper around a store product.
class StoreProduct {
  // The product identifier
  final String productIdentifier;

  // The localized price.
  final String localizedPrice;

  // The localized subscription period.
  final String localizedSubscriptionPeriod;

  // The subscription period unit, e.g., week.
  final String period;

  // The number of weeks in the product's subscription period.
  final int periodWeeks;

  // The string value of the number of weeks in the product's subscription period.
  final String periodWeeksString;

  // The number of months in the product's subscription period.
  final int periodMonths;

  // The string value of the number of months in the product's subscription period.
  final String periodMonthsString;

  // The number of years in the product's subscription period.
  final int periodYears;

  // The string value of the number of years in the product's subscription period.
  final String periodYearsString;

  // The number of days in the product's subscription period.
  final int periodDays;

  // The string value of the number of days in the product's subscription period.
  final String periodDaysString;

  // The product's localized daily price.
  final String dailyPrice;

  // The product's localized weekly price.
  final String weeklyPrice;

  // The product's localized monthly price.
  final String monthlyPrice;

  // The product's localized yearly price.
  final String yearlyPrice;

  // A boolean indicating whether the product has an introductory price.
  final bool hasFreeTrial;

  // The product's trial period end date.
  final DateTime? trialPeriodEndDate;

  // The product's trial period end date formatted using `DateFormatter.Style.medium`
  final String trialPeriodEndDateString;

  // The product's introductory price duration in days.
  final String localizedTrialPeriodPrice;

  // The product's introductory price duration in days.
  final double trialPeriodPrice;

  // The product's introductory price duration in days.
  final int trialPeriodDays;

  // The product's string value of the introductory price duration in days.
  final String trialPeriodDaysString;

  // The product's introductory price duration in weeks.
  final int trialPeriodWeeks;

  // The product's string value of the introductory price duration in weeks.
  final String trialPeriodWeeksString;

  // The product's introductory price duration in months.
  final int trialPeriodMonths;

  // The product's string value of the introductory price duration in months.
  final String trialPeriodMonthsString;

  // The product's introductory price duration in years.
  final int trialPeriodYears;

  // The product's string value of the introductory price duration in years.
  final String trialPeriodYearsString;

  // The product's introductory price duration in days, e.g., 7-day.
  final String trialPeriodText;

  // The product's locale.
  final String locale;

  // The language code of the product's locale.
  final String? languageCode;

  // The currency code of the product's locale.
  final String? currencyCode;

  // The currency symbol of the product's locale.
  final String? currencySymbol;

  // A boolean that indicates whether the product is family shareable.
  final bool isFamilyShareable;

  // The region code of the product's price locale.
  final String? regionCode;

  // The price of the product in the local currency.
  final double price;

  StoreProduct({
    required this.productIdentifier,
    required this.localizedPrice,
    required this.localizedSubscriptionPeriod,
    required this.period,
    required this.periodWeeks,
    required this.periodWeeksString,
    required this.periodMonths,
    required this.periodMonthsString,
    required this.periodYears,
    required this.periodYearsString,
    required this.periodDays,
    required this.periodDaysString,
    required this.dailyPrice,
    required this.weeklyPrice,
    required this.monthlyPrice,
    required this.yearlyPrice,
    required this.hasFreeTrial,
    this.trialPeriodEndDate,
    required this.trialPeriodEndDateString,
    required this.localizedTrialPeriodPrice,
    required this.trialPeriodPrice,
    required this.trialPeriodDays,
    required this.trialPeriodDaysString,
    required this.trialPeriodWeeks,
    required this.trialPeriodWeeksString,
    required this.trialPeriodMonths,
    required this.trialPeriodMonthsString,
    required this.trialPeriodYears,
    required this.trialPeriodYearsString,
    required this.trialPeriodText,
    required this.locale,
    this.languageCode,
    this.currencyCode,
    this.currencySymbol,
    required this.isFamilyShareable,
    this.regionCode,
    required this.price,
  });

  factory StoreProduct.fromJson(Map<dynamic, dynamic> json) {
    return StoreProduct(
      productIdentifier: json['productIdentifier'],
      localizedPrice: json['localizedPrice'],
      localizedSubscriptionPeriod: json['localizedSubscriptionPeriod'],
      period: json['period'],
      periodWeeks: json['periodWeeks'],
      periodWeeksString: json['periodWeeksString'],
      periodMonths: json['periodMonths'],
      periodMonthsString: json['periodMonthsString'],
      periodYears: json['periodYears'],
      periodYearsString: json['periodYearsString'],
      periodDays: json['periodDays'],
      periodDaysString: json['periodDaysString'],
      dailyPrice: json['dailyPrice'],
      weeklyPrice: json['weeklyPrice'],
      monthlyPrice: json['monthlyPrice'],
      yearlyPrice: json['yearlyPrice'],
      hasFreeTrial: json['hasFreeTrial'],
      trialPeriodEndDate: DateTime.tryParse(json['trialPeriodEndDate']),
      trialPeriodEndDateString: json['trialPeriodEndDateString'],
      localizedTrialPeriodPrice: json['localizedTrialPeriodPrice'],
      trialPeriodPrice: json['trialPeriodPrice'],
      trialPeriodDays: json['trialPeriodDays'],
      trialPeriodDaysString: json['trialPeriodDaysString'],
      trialPeriodWeeks: json['trialPeriodWeeks'],
      trialPeriodWeeksString: json['trialPeriodWeeksString'],
      trialPeriodMonths: json['trialPeriodMonths'],
      trialPeriodMonthsString: json['trialPeriodMonthsString'],
      trialPeriodYears: json['trialPeriodYears'],
      trialPeriodYearsString: json['trialPeriodYearsString'],
      trialPeriodText: json['trialPeriodText'],
      locale: json['locale'],
      languageCode: json['languageCode'],
      currencyCode: json['currencyCode'],
      currencySymbol: json['currencySymbol'],
      isFamilyShareable: json['isFamilyShareable'],
      regionCode: json['regionCode'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productIdentifier': productIdentifier,
      'localizedPrice': localizedPrice,
      'localizedSubscriptionPeriod': localizedSubscriptionPeriod,
      'period': period,
      'periodWeeks': periodWeeks,
      'periodWeeksString': periodWeeksString,
      'periodMonths': periodMonths,
      'periodMonthsString': periodMonthsString,
      'periodYears': periodYears,
      'periodYearsString': periodYearsString,
      'periodDays': periodDays,
      'periodDaysString': periodDaysString,
      'dailyPrice': dailyPrice,
      'weeklyPrice': weeklyPrice,
      'monthlyPrice': monthlyPrice,
      'yearlyPrice': yearlyPrice,
      'hasFreeTrial': hasFreeTrial,
      'trialPeriodEndDate': trialPeriodEndDate?.toIso8601String(),
      'trialPeriodEndDateString': trialPeriodEndDateString,
      'localizedTrialPeriodPrice': localizedTrialPeriodPrice,
      'trialPeriodPrice': trialPeriodPrice,
      'trialPeriodDays': trialPeriodDays,
      'trialPeriodDaysString': trialPeriodDaysString,
      'trialPeriodWeeks': trialPeriodWeeks,
      'trialPeriodWeeksString': trialPeriodWeeksString,
      'trialPeriodMonths': trialPeriodMonths,
      'trialPeriodMonthsString': trialPeriodMonthsString,
      'trialPeriodYears': trialPeriodYears,
      'trialPeriodYearsString': trialPeriodYearsString,
      'trialPeriodText': trialPeriodText,
      'locale': locale,
      'languageCode': languageCode,
      'currencyCode': currencyCode,
      'currencySymbol': currencySymbol,
      'isFamilyShareable': isFamilyShareable,
      'regionCode': regionCode,
      'price': price,
    };
  }
}
