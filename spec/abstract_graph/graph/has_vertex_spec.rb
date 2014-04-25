require 'spec_helper'

module AbstractGraph

  shared_examples "has_vertex?(String)" do

    it "returns whether the string name is a named vertex in the graph" do
      subject.add_vertex "MyVertex"
      subject.has_vertex?( "MyVertex" ).should be_true
    end

    it "returns false when the string is not a named vertex" do
      subject.has_vertex?( "MyVertex" ).should be_false
      subject.has_vertex?( "AlsoFalse" ).should_not be_nil
    end

  end

end
