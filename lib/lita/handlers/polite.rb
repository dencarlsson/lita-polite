module Lita
  module Handlers
    class Polite < Handler
      route %r{.*(thanks|thank you|cheers|nice one).*}i, :polite_response, command: true
      route %r{.*(bye|good bye|see you).*}i, :farewell_response, command: true

      def polite_response(response)
        politeResponse = ["You're welcome.",
                          "No problem.",
                          "Anytime.",
                          "That's what I'm here for!",
                          "You are more than welcome.",
                          "You don't have to thank me, I'm your loyal servant.",
                          "Don't mention it."]

        response.reply politeResponse.sample
      end

      def farewell_response(response)
        farewellResponse = ["Goodbye",
                            "Have a good evening",
                            "Bye",
                            "Take care",
                            "Nice speaking with you",
                            "See you later"]

        response.reply farewellResponse.sample
      end
    end
    Lita.register_handler(Polite)
  end
end
