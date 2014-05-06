require 'spec_helper'

module AbstractGraph

  describe Graph do
    describe "#implementation" do
      subject { Graph.new }

      it "already has implementation adjacency list" do
        subject.implementation.should eql(:adjacency_list)
      end

    end

    describe "#implementation=" do
      subject { Graph.new }

      it "can be set to another implementation" do
        subject.implementation = :naive
        subject.implementation.should eql(:naive)
      end

      it "doesn't allow non-implementations" do
        expect do
          subject.implementation = :bogey
        end.to raise_error
      end

    end

  end
end
