require 'spec_helper'

module AbstractGraph
  describe Graph do
    describe ".add_implementation(Symbol, Class)" do
      subject { Graph.dup }

      it "successfully adds an implementation" do
        subject.add_implementation :cool, Class.new
        subject.new implementation: :cool
      end

    end
  end
end
