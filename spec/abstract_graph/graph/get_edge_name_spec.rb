require 'spec_helper'

module AbstractGraph

  shared_examples "get_edge_name(String,String)" do

    before :all do
      # create the 3-path
      @v1 = "v1"
      @v2 = "v2"
      @v3 = "v3"
      @e1 = "e1"
      @e2 = "e2"
    end

    before :each do
      subject.add_vertex @v1
      subject.add_vertex @v2
      subject.add_vertex @v3
      subject.add_edge @e1, @v1, @v2
      subject.add_edge @e2, @v3, @v2
    end

    it "returns the name of the edge connecting the two string vertices" do
      subject.get_edge_name( @v1, @v2 ).should eql(@e1)
      subject.get_edge_name( @v2, @v3 ).should eql(@e2)
    end

    it "returns nil if the two vertices are not adjacent" do
      subject.get_edge_name( @v1, @v3).should be_nil
    end

  end

end
