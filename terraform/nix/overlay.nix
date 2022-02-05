self: super: {
  dhall = super.dhall.override
    {
      version = "1.30.0";
    };
}
