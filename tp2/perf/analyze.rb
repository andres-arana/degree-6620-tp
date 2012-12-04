require "csv"

class Analyzer
  def initialize
    @stats = []
  end

  def analyze
    accumulate_stats_on "build/perf/time"
    avg = @stats.inject { |s, e| s + e } / @stats.size
    puts ""
    puts "*************************************"
    puts "Average execution time: #{avg}"
  end

  private
  def accumulate_stats_on(file)
    File.open file do |f|
      until f.eof?
        f.readline
        data = f.readline.slice(7..11).to_f
        f.readline
        f.readline
        @stats.push data
      end
    end
  end
end

Analyzer.new.analyze
