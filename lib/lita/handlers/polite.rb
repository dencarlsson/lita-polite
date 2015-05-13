module Lita
  module Handlers
    class Polite < Handler
      route %r{.*(hello|hi|good morning|morning|welcome).*}i, :greeting_response, command: true
      route %r{.*(thanks|thank you|cheers|nice one).*}i, :polite_response, command: true
      route %r{.*(bye|good bye|see you).*}i, :farewell_response, command: true
      route %r{.*(you are the best|you are awesome).*}i, :best_response

      def greeting_response(response)
        greetingResponse = ["Hello", 
                            "Greetings, #{response.user.name}.",
                            "Well hello there, #{response.user.name}.",
                            "Hey #{response.user.name}, Hello!",
                            "Good day, #{response.user.name}",
                            "Hi."]

        message = greetingResponse.sample

        response.reply message
      end

      def polite_response(response)
        politeResponse = ["You're welcome, #{response.user.name}.",
                          "No problem.",
                          "Anytime.",
                          "That's what I'm here for!",
                          "You are more than welcome, #{response.user.name}.",
                          "You don't have to thank me, I'm your loyal servant.",
                          "Don't mention it."]

        response.reply politeResponse.sample
      end

      def farewell_response(response)
        farewellResponse = ["Goodbye",
                            "Have a good evening",
                            "Bye",
                            "Take care, #{response.user.name}.",
                            "Be safe, #{response.user.name}.",
                            "Nice speaking with you, #{response.user.name}",
                            "See you later"]

        response.reply farewellResponse.sample
      end

      def best_response(response)
        response.reply "No you are, #{response.user.name}."
      end
    end

    Lita.register_handler(Polite)
  end
end
