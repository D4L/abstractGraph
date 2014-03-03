namespace :benchmark do

  desc "Test that benchmarks work"
  task :test do
    p "Setting up benchmarking"
    setup_benchmark

    p "Testing benchmarking"
    Timer.start
    AbstractGraph::Graph.petersen_graph
  end

  desc "Benchmark a file with AbstractGraph code"
  task :run, :file_path do |t, args|
    setup_benchmark
    Timer.start
    require args[:file_path]
  end

  module Timer
    class << self
      def start
        @start_time = Time.now
      end

      def start_method method
        p "start #{method} #{'%.8f' % (Time.now - @start_time)}"
      end

      def end_method method
        p "end #{method} #{'%.8f' % (Time.now - @start_time)}"
      end
    end
  end

  def setup_benchmark
    AbstractGraph::Graph.instance_methods(false).each do |method|
      AbstractGraph::Graph.send( :alias_method, "benched_#{method}", method )
      AbstractGraph::Graph.send( :define_method, method ) do |*args, &block|
        Timer.start_method method
        send( "benched_#{method}", *args, &block )
        Timer.end_method method
      end
    end
  end
end

