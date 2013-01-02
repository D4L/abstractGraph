require 'spec_helper'

module AbstractGraph
  module Composition
    describe UniqueNameCollection do

      before :each do
        @collection = UniqueNameCollection.new
        @dummies = ('a'..'z').map do |c|
          d = Dummy.new
          d.name = c
          d
        end
        @dummies.each do |d|
          @collection.add d
        end
      end

      describe "#size" do

        it "should return the size of the collection" do
          @collection.size.should == @dummies.count
        end

      end

      describe "#has_key?(String)" do

        it "should return whether the string is an included name" do
          @collection.has_key?('d').should be_true
          @collection.has_key?('saddy').should be_false
        end

      end

      describe "#each_key" do

        it "goes through every name in the collection" do
          alphabet = ""
          @collection.each_key do |c|
            alphabet += c
          end
          alphabet.should == "abcdefghijklmnopqrstuvwxyz"
        end

      end

    end
  end
end
