require 'spec_helper'

module AbstractGraph
  shared_examples "add_implementation(Symbol, Class)" do

    it "adds to the implementation array" do
      subject.add_implementation :cool, Class.new
      Graph::ImplementationHelper.implementation_list.should include(:cool)
    end

  end
end
