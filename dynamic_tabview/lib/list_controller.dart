class ListController {
  //! listReturn can be an api call response (dynamic list) or a static list like below.
  //! Return the list based on the 'id'
  List<String> listReturn({required keyForApi}) {
    switch (keyForApi) {
      case '001':
        return [
          'Premium Plan - 1 Month',
          'Premium Plan - 3 Months',
          'Premium Plan - 6 Months',
          'Premium Plan - 12 Months',
          'Premium Plan - Family',
          'Premium Plan - Student',
          'Premium Plan - Annual',
          'Premium Plan - Lifetime',
          'Premium Plan - Business',
          'Premium Plan - Enterprise'
        ];

      case '002':
        return [
          'Gold Plan - 1 Month',
          'Gold Plan - 3 Months',
          'Gold Plan - 6 Months',
          'Gold Plan - 12 Months',
          'Gold Plan - Family',
          'Gold Plan - Student',
          'Gold Plan - Annual',
          'Gold Plan - Lifetime',
          'Gold Plan - Business',
          'Gold Plan - Enterprise'
        ];

      case '003':
        return [
          'Bronze Plan - 1 Month',
          'Bronze Plan - 3 Months',
          'Bronze Plan - 6 Months',
          'Bronze Plan - 12 Months',
          'Bronze Plan - Family',
          'Bronze Plan - Student',
          'Bronze Plan - Annual',
          'Bronze Plan - Lifetime',
          'Bronze Plan - Business',
          'Bronze Plan - Enterprise'
        ];

      case '004':
        return [
          'Silver Plan - 1 Month',
          'Silver Plan - 3 Months',
          'Silver Plan - 6 Months',
          'Silver Plan - 12 Months',
          'Silver Plan - Family',
          'Silver Plan - Student',
          'Silver Plan - Annual',
          'Silver Plan - Lifetime',
          'Silver Plan - Business',
          'Silver Plan - Enterprise'
        ];

      default:
        return [];
    }
  }
}
