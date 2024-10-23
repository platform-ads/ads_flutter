abstract class SendCodeRepository {
  Future<String?> sendCode(String code, String appId, String clientSecret);
}
