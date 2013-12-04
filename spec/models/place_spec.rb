require 'spec_helper'

describe Place do
  let(:place) { build(:place) }

  it "should have a valid factory" do
    expect(build(:place)).to be_valid
  end

  describe "public interface" do
    it { should respond_to  :factual_id }
    it { should respond_to  :name }
    it { should respond_to  :telephone }
    it { should respond_to  :address }
    it { should respond_to  :postcode }
    it { should respond_to  :region }
    it { should respond_to  :country }
    it { should respond_to  :lat }
    it { should respond_to  :lng }
  end

  describe "#name" do
    it { should validate_presence_of  :name }
  end

  describe "#lat" do
    context "with invalid latitude" do
      it "should not allow latitude to be nil if longitude is set" do
        place.lat = nil
        expect(place).not_to be_valid
      end
    end

    context "with valid latitude" do
      it "should allow latitude to be nil if longitude is not set" do
        place.lng = nil
        place.lat = nil
        expect(place).to be_valid
      end
    end
  end

  describe "#lng" do
    context "with invalid longitude" do
      it "should not allow longitude to be nil if latitude is  set" do
        place.lng = nil
        expect(place).not_to be_valid
      end
    end

    context "with valid longitude" do
      it "should allow longitude to be nil if latitude is not set" do
        place.lat = nil
        place.lng = nil
        expect(place).to be_valid
      end
    end
  end

  describe "#address" do
    context "with invalid address" do
      it "should not allow address to be nil if latitude and longitude not set" do
        place.lat = nil
        place.lng = nil
        place.address = nil
        expect(place).not_to be_valid
      end
    end

    context "with valid address" do
      it "should allow address to be nil if latitude and longitude set" do
        place.address = nil
        expect(place).to be_valid
      end
    end
  end
end