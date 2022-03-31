abstract class Config {
  static const env = Env.prod;
  static const apiVersion = 'v1';
}

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
  static const test = 'test';
}
