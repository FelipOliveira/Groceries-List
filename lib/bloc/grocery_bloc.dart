import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'grocery_event.dart';
part 'grocery_state.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  GroceryBloc() : super(GroceryInitial());

  @override
  Stream<GroceryState> mapEventToState(
    GroceryEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
