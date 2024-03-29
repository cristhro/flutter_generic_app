import 'dart:async';

import 'package:flutter/cupertino.dart';

class DialogRequest {
  final String title;
  final String description;
  final String buttonTitle;
  final String? cancelTitle;

  DialogRequest({required this.title, required this.description, required this.buttonTitle, this.cancelTitle});
}

class DialogResponse {
  final String? fieldOne;
  final String? fieldTwo;
  final bool? confirmed;

  DialogResponse({
    this.fieldOne,
    this.fieldTwo,
    this.confirmed,
  });
}


class DialogService {
  final GlobalKey<NavigatorState> _dialogNavigationKey = GlobalKey<NavigatorState>();
  // ignore: use_late_for_private_fields_and_variables
  Function(DialogRequest)? _showDialogListener;
  Completer<DialogResponse>? _dialogCompleter;

  GlobalKey<NavigatorState> get dialogNavigationKey => _dialogNavigationKey;

  /// Registers a callback function. Typically to show the dialog
  Future<void> registerDialogListener(Function(DialogRequest) showDialogListener) async {
    _showDialogListener = showDialogListener;
  }

  /// Calls the dialog listener and returns a Future that will wait for dialogComplete.
  Future<DialogResponse>? showDialog({
    String title = '',
    String description = '',
    String buttonTitle = 'Ok',
  }) {
    _dialogCompleter = Completer<DialogResponse>();
    _showDialogListener!(DialogRequest(
      title: title,
      description: description,
      buttonTitle: buttonTitle,
    ));
    return _dialogCompleter?.future;
  }

  /// Shows a confirmation dialog
  Future<DialogResponse>? showConfirmationDialog(
      {required String title, required String description, String confirmationTitle = 'Ok', String cancelTitle = 'Cancel'}) {
    _dialogCompleter = Completer<DialogResponse>();
    _showDialogListener!(DialogRequest(title: title, description: description, buttonTitle: confirmationTitle, cancelTitle: cancelTitle));
    return _dialogCompleter?.future;
  }

  /// Completes the _dialogCompleter to resume the Future's execution call
  void dialogComplete(DialogResponse response) {
    _dialogNavigationKey.currentState!.pop();
    _dialogCompleter?.complete(response);
    _dialogCompleter = null;
  }
}
