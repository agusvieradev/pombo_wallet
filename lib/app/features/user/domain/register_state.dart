class RegisterState {
  RegisterState({
    this.isLoading = false,
    this.isError = false,
    this.isSuccess = false,
    this.errorMessage = '',
  });
  final bool isLoading;
  final bool isError;
  final bool isSuccess;
  final String errorMessage;
}
