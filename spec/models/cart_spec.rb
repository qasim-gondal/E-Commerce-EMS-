require "rails_helper"

RSpec.describe Cart, type: :model do
  describe "Associations" do
    it { should have_many :products }
  end
end
