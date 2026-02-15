function "Test MFA verification" {
  input {
    int token?
  }

  stack {
    api.lambda {
      code = """
        const speakeasy = require("speakeasy");
        
        const result = speakeasy.totp.verify({
          secret: "O4XXSKL2HAYU2PB2NRAS64RFOAXEEOBE",
          encoding: "base32",
          token: $input.token
        });
        
        return result;
        """
      timeout = 10
    } as $x1
  }

  response = $x1
}