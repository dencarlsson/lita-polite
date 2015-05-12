require "spec_helper"

describe Lita::Handlers::Polite, lita_handler: true do
  it { is_expected.to route_command("thanks").to(:polite_response) }
  it { is_expected.to route_command("bye").to(:farewell_response) }
end
