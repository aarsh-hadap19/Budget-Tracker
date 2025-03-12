import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

double? addAmount(List<TransactionsStruct>? transactions) {
  // add all the amounts
// To complete the `newCustomFunction` that sums all the amounts from a list of `TransactionsStruct`, we need to iterate through the list, check if each transaction has a valid amount, and then accumulate these amounts. Here's how you can implement this function:

// ```dart
  if (transactions == null || transactions.isEmpty) {
    return null; // Return null if the list is null or empty
  }

  double totalAmount = 0.0; // Initialize total amount

  for (var transaction in transactions) {
    if (transaction.hasAmount()) {
      // Check if the transaction has a valid amount
      totalAmount += transaction.amount; // Add the amount to the total
    }
  }

  return totalAmount; // Return the total amount
// ```

// ### Explanation:
// 1. **Null and Empty Check**: The function first checks if the `transactions` list is `null` or empty. If it is, the function returns `null`.
// 2. **Initialization**: A variable `totalAmount` is initialized to `0.0` to keep track of the sum of amounts.
// 3. **Iteration**: The function iterates through each `TransactionsStruct` in the list.
// 4. **Amount Check**: For each transaction, it checks if the amount is valid using the `hasAmount()` method.
// 5. **Accumulation**: If the amount is valid, it adds the amount to `totalAmount`.
// 6. **Return Value**: Finally, it returns the total amount.

// This function will effectively sum up all the valid amounts from the provided list of transactions.
}
