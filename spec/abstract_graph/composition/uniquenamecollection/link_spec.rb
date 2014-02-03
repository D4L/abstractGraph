require 'spec_helper'

module AbstractGraph
  module Composition
    describe UniqueNameCollection do

      before :each do
        @collection1 = UniqueNameCollection.new
        @collection2 = UniqueNameCollection.new
        @dummy = Dummy.new
        @dummy.name = "DummyName"
        @dummy2 = Dummy.new
        @dummy2.name = "DummyName"
      end

      describe "#link(UniqueNameCollection)" do

        it "doesn't allow first collection to add object of same name" do
          @collection1.link @collection2
          @collection2.add @dummy
          expect { @collection1.add @dummy2 }.to raise_error
        end

        it "doesn't allow second collection to add object of same name" do
          @collection1.link @collection2
          @collection1.add @dummy
          expect { @collection2.add @dummy2 }.to raise_error
        end

        it "doesn't allow second collection to re-add objects that already existed" do
          @collection1.add @dummy
          @collection1.link @collection2
          expect { @collection2.add @dummy2 }.to raise_error
        end

        it "doesn't allow first collection to re-add objects that already existed" do
          @collection2.add @dummy
          @collection1.link @collection2
          expect { @collection1.add @dummy2 }.to raise_error
        end

        it "returns nil if the intersection during link isn't nil" do
          @collection1.add @dummy
          @collection2.add @dummy2
          @collection1.link(@collection2).should be_nil
        end

        it "allows a same object ofter deletion" do
          @collection1.add @dummy
          @collection1.link @collection2
          @collection1.collection.delete @dummy.name
          expect { @collection2.add @dummy2 }.to_not raise_error
        end

        it "can link more than 2 collections together" do
          collection3 = UniqueNameCollection.new
          @collection1.link @collection2
          @collection2.link collection3
          @collection1.add @dummy
          expect { collection3.add @dummy2 }.to raise_error
        end

      end

    end
  end
end
