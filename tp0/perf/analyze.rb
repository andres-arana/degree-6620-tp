require "csv"

class Analyzer
  def initialize
    @stats = { "quicks" => {}, "stooge" => {}}
  end

  def analyze
    Dir.foreach "perf/times" do |entry|
      accumulate_stats_on "perf/times/#{entry}" unless entry[0] == '.'
    end
    export
  end

  private
  def accumulate_stats_on(file)
    puts "Accumulating stats on #{file}"
    algorithm = file.slice(11..16)

    File.open file do |f|
      f.readline
      until f.eof?
        f.readline
        datafile = f.readline.slice(13..22).chomp
        f.readline
        time = f.readline.slice(7..11).to_f
        f.readline
        f.readline
        accumulate algorithm, datafile, time
      end
    end
  end

  def accumulate(algorithm, file, time)
    stats = @stats[algorithm]
    stats[file] = [] unless stats.has_key?(file)
    stats[file].push time
  end

  def export
    @stats.each do |algo, stats|
      CSV.open("build/perf/analyzed/#{algo}.csv", "wb") do |csv|
        export_algorithm_stats stats, csv
      end
    end
  end

  def export_algorithm_stats(stats, csv)
    stats.each do |experiment, times|
      average = times.inject { |sum, element| sum + element } / times.size
      csv << [ experiment, average ]
    end
  end
end

Analyzer.new.analyze
