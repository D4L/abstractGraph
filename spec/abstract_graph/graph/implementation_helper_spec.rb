require 'spec_helper'

module AbstractGraph
  describe Graph::ImplementationHelper do

    let :class_with_helper do
      Class.new do
        include Graph::ImplementationHelper
      end
    end

    subject { class_with_helper }

    it_has_method "add_implementation(Symbol, Class)"
  end
end
