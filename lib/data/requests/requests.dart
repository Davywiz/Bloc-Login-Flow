class LoginRequest {
  String email;
  String password;
  LoginRequest(
    this.email,
    this.password,
  );
}

class RegisterRequest {
  String name;
  String email;
  String password;

  RegisterRequest(
    this.email,
    this.name,
    this.password,
  );
}
