require 'spec_helper'

module AbstractGraph
  describe Graph do
    context "with naive implementation" do
      subject { Graph.new implementation: :naive }
      it_has_method "adjacency_list(String)"
      it_has_method "add_edge(String, String, String)"
      it_has_method "add_vertex(String)", :naive
      it_has_method "change_edge_name(String,String)"
      it_has_method "change_vertex_name(String,String)"
      it_has_method "connected?", :naive
      it_has_method "delete_edge(String)"
      it_has_method "delete_edge!(String)"
      it_has_method "delete_vertex(String)"
      it_has_method "delete_vertex!(String)"
      it_has_method "dup"
      it_has_method "get_edge_name(String,String)"
      it_has_method "has_edge?(String)"
      it_has_method "has_vertex?(String)"
      it_has_method "is_adjacent?(String,String)"
      it_has_method "merge_vertices(String,String,String)"
      it_has_method "merge_vertices!(String,String,String)"
      it_has_method "merge_vertices(Array,String)"
      it_has_method "merge_vertices!(Array,String)"
      it_has_method "split_vertex(String)", :naive
    end
  end
end
