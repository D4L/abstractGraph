require 'spec_helper'

module AbstractGraph
  module Composition
    describe UniqueNameCollection do

      before(:each) do
        @collection = UniqueNameCollection.new
        @dummy = Dummy.new
        @dummy.name = "DummyName"
      end

      describe "#add(Object)" do

        it "tracks an object that has implemented #name" do
          @collection.add @dummy
        end

        it "doesn't allow us to add the same object twice" do
          @collection.add @dummy
          expect { @collection.add @dummy }.to raise_error
        end

        it "doesn't allow two objects to have the same name" do
          dummy2 = Dummy.new
          dummy2.name = "DummyName"
          @collection.add @dummy
          expect { @collection.add dummy2 }.to raise_error
        end

        it "allows a same named object after deleting it" do
          @collection.add @dummy
          @collection.collection.delete @dummy.name
          expect { @collection.add @dummy }.to_not raise_error
        end

      end

    end
  end
end
