defmodule Demo.Cldr do
  use Cldr,
    otp_app: :demo,
    locales: [
      "en"
    ],
    default_locale: "en",
    providers: [Cldr.Number, Money]
end
