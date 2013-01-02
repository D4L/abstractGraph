require 'spec_helper'

module AbstractGraph
  module Composition
    describe UniqueNameCollection do

      before (:each) do
        @collection = UniqueNameCollection.new
      end

      describe "#new" do

        it "returns an object of class UniqueNameCollection" do
          @collection.should be_an_instance_of(UniqueNameCollection)
        end

      end

    end
  end
end
