// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'messages';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "greeting" : MessageLookupByLibrary.simpleMessage("Good Day."),
    "introductionWithAge" : MessageLookupByLibrary.simpleMessage("I am y years old."),
    "introductionWithName" : MessageLookupByLibrary.simpleMessage("My name is x."),
    "questionCanIHelp" : MessageLookupByLibrary.simpleMessage("How may I help you?"),
    "questionHowAreYou" : MessageLookupByLibrary.simpleMessage("How are you today?"),
    "title" : MessageLookupByLibrary.simpleMessage("Hello World")
  };
}
