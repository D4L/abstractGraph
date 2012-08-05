require 'spec_helper'

describe AbstractGraph do
  describe initialise do
    it 'should return correct version string' do
      AbstractGraph.version_string.should == "AbstractGraph version #{AbstractGraph::VERSION}"
    end
  end
end
