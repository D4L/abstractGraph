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

    context "with adjacency list implementation" do
      subject { Graph.new implementation: :adjacency_list }
      it_has_method "adjacency_list(String)"
      it_has_method "add_edge(String, String, String)"
      it_has_method "add_vertex(String)", :adjacency_list
      it_has_method "change_edge_name(String,String)"
      it_has_method "change_vertex_name(String,String)"
      it_has_method "connected?", :adjacency_list
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
      it_has_method "split_vertex(String)", :adjacency_list
    end

    context "with adjacency matrix implementation" do
      subject { Graph.new implementation: :adjacency_matrix }
      it_has_method "adjacency_list(String)"
      it_has_method "add_edge(String, String, String)"
      it_has_method "add_vertex(String)", :adjacency_matrix
      it_has_method "change_edge_name(String,String)"
      it_has_method "change_vertex_name(String,String)"
      it_has_method "connected?", :adjacency_matrix
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
      it_has_method "split_vertex(String)", :adjacency_matrix
    end

    context "with dynamic implementation" do
      subject { Graph.new implementation: :dynamic_impl }
      it_has_method "adjacency_list(String)"
      it_has_method "add_edge(String, String, String)"
      it_has_method "add_vertex(String)", :dynamic_impl
      it_has_method "change_edge_name(String,String)"
      it_has_method "change_vertex_name(String,String)"
      it_has_method "connected?", :adjacency_matrix
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
      it_has_method "split_vertex(String)", :dynamic_impl
    end
  end
end
