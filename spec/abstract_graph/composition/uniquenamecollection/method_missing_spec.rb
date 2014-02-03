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

      describe "#each" do

        it "goes through every object in the collection" do
          @collection.each do |c|
            c.should be_an_instance_of(Dummy)
          end
        end

      end

    end
  end
end
