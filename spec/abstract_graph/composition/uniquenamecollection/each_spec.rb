require 'spec_helper'

module AbstractGraph
  module Composition
    describe UniqueNameCollection do

      before(:each) do
        @collection = UniqueNameCollection.new
        dummy = Dummy.new
        dummy.name = "DummyName"
        @collection.add dummy
        dummy2 = Dummy.new
        dummy2.name = "DummyName2"
        @collection.add dummy2
      end

      describe "#each(&Block)" do

        it "returns an object of type Enumerable" do
          @collection.each.should be_an_instance_of(Enumerator)
        end

        it "returns an object of type Hash if passed a block" do
          @collection.each{}.should be_an_instance_of(Hash)
          @collection.each{|d|}.should be_an_instance_of(Hash)
        end

        it "passes each object back to the block of arity 1" do
          @collection.each do |d|
            d.should be_an_instance_of( Dummy )
          end
        end

      end

    end
  end
end
