require 'spec_helper'

module AbstractGraph
  module Composition
    describe UniqueNameCollection do

      before :all do
        @name = "name"
        @newname = "newname"
      end

      before :each do
        @collection = UniqueNameCollection.new
        @dummy = Dummy.new
        @dummy.name = @name
        @collection.add @dummy
      end

      describe "#rename(String,String)" do

        it "removes the original name from the hash" do
          @collection.rename @name, @newname
          @collection[@name].should be_nil
        end

        it "renames the dummy object" do
          @collection.rename @name, @newname
          @dummy.name.should == @newname
        end

        it "throws an exception if the new name exists" do
          @dummy = Dummy.new
          @dummy.name = @newname
          @collection.add @dummy
          expect { @collection.rename @name, @newname }.to raise_error
        end

      end

    end
  end
end
