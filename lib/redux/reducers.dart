import 'package:redux_beginng/redux/actions.dart';
import 'package:redux_beginng/redux/store.dart';

AppState reducers(AppState prevState, dynamic action) {
  late AppState newState;

  if (action is UpdateKm) {
    print(action);
    print(action.payload);

    newState = AppState.copyWith(prev: prevState, km: action.payload);

    print(newState);
    print(newState.km);
  } else if (action is Convert) {
    print(action);
    //! THE FOLLOW CODE BELONGS IN MIDDLEWARE
    //! NOT IN REDUCERS
    double kmAsDouble = double.parse(prevState.km);
    double milesAsDouble = kmAsDouble * 0.621371;

    print(milesAsDouble);

    newState =
        AppState.copyWith(prev: prevState, miles: milesAsDouble.toString());
  }

  return newState;
}