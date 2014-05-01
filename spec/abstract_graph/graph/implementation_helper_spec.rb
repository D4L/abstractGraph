require 'spec_helper'

module AbstractGraph
  describe Graph::ImplementationHelper do
    subject { Graph::ImplementationHelper }
    it "has module array of implementations" do
      subject.class_variable_defined?(:@@implementation_list).should be_true
      subject.class_variable_get(:@@implementation_list).should be_an_instance_of(Array)
    end
  end
end
