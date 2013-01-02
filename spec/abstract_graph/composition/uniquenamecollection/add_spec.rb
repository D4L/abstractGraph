require 'spec_helper'

module AbstractGraph
  module Composition
    describe UniqueNameCollection do

      before(:each) do

        @collection = UniqueNameCollection.new
      end

      describe "#add(Object)" do

        it "tracks an object that has implemented #name" do
          dummy = Dummy.new
          dummy.name = "Hello"
          @collection.add dummy
        end

        it "doesn't allow us to add the same object twice" do
          dummy = Dummy.new
          dummy.name = "Hello"
          @collection.add dummy
          expect { @collection.add dummy }.to raise_error
        end

        it "doesn't allow two objects to have the same name" do
          dummy = Dummy.new
          dummy2 = Dummy.new
          dummy.name = "Hello"
          dummy2.name = "Hello"
          @collection.add dummy
          expect { @collection.add dummy2 }.to raise_error
        end

      end

    end
  end
end
