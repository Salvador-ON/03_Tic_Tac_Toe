require '../lib/validation.rb'

RSpec.describe Validation do
  describe "#names" do
    it "returns true when valid" do
      validation = Validation.new
      expect(validation.names('sala')).to eql(false)
    end
  end
end
