function "Test MFA generation" {
  input {
  }

  stack {
    api.lambda {
      code = """
        // Generates a base32-encoded TOTP secret (compatible with Google Authenticator)
        const speakeasy = require("speakeasy");
        
        const secret = speakeasy.generateSecret({
          length: 20,       // 20 bytes = 160 bits (recommended)
          name: "Kora ilir@bluemongoose.io"
        });
        
        return {
          base32: secret.base32,
          otpauth_url: secret.otpauth_url
        };
        """
      timeout = 10
    } as $x1
  }

  response = $x1
}