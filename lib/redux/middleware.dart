import 'package:redux/redux.dart';
import 'package:redux_beginng/redux/actions.dart';
import 'store.dart';

bool isNumeric(String c) {
  ///isNumeric takes a string of length 1
  ///returns true if string is numeric, returns false if otherwise
  return c.compareTo('0') >= 0 && c.compareTo('9') <= 0;
}

void appStateMiddleWare(
    Store<AppState> store, dynamic action, NextDispatcher next) {
  print("in the middleware");
  if (action is UpdateKm) {
    String cleanedString = '';
    for (String c in action.payload.split('')) {
      if (isNumeric(c)) {
        print("Adding $c to cleanedString");
        cleanedString += c;
        print("cleanedString is $cleanedString");
      } else {
        print("$c is not recognized as numeric");
      }
    }

    store.dispatch(UpdateKmCleaned(cleanedString));
  } else if (action is Convert) {
    double kmAsDouble = double.parse(store.state.km);
    double milesAsDouble = kmAsDouble * 0.621371;

    store.dispatch(UpdateMiles(milesAsDouble.toString()));
  }

  next(action);
}
