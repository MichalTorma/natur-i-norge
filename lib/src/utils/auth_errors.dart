String friendlyAuthErrorMessage(Object error) {
  final message = error.toString().toLowerCase();

  if (message.contains('popup-closed-by-user') ||
      message.contains('cancelled') ||
      message.contains('canceled')) {
    return 'Sign-in was cancelled.';
  }
  if (message.contains('network')) {
    return 'Network error. Check your connection and try again.';
  }
  if (message.contains('unauthorized-domain') ||
      message.contains('auth/unauthorized-domain')) {
    return 'This website is not authorized for Google sign-in yet.';
  }
  if (message.contains('operation-not-allowed')) {
    return 'Google sign-in is not enabled for this app.';
  }
  if (message.contains('null check')) {
    return 'Google sign-in is not configured for web yet.';
  }

  return 'Sign-in failed. Please try again.';
}
