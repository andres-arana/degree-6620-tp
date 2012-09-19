require "csv"

class Analyzer
  def initialize
    @stats = { "quicks" => {}, "stooge" => {}}
  end

  def analyze
    Dir.foreach "perf/times" do |entry|
      accumulate_stats_on "perf/times/#{entry}" unless entry[0] == '.'
    end
    export_graphics
    export_speed_up
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

  def export_speed_up
    qstats = @stats['quicks']
    sstats = @stats['stooge']

    File.open "build/perf/analyzed/speedupdata", "w" do |f|
      f.puts '# Columns:'
      f.puts '# 1: Processed file size'
      f.puts '# 2: Long lines, sorted order'
      f.puts '# 3: Long lines, inverse order'
      f.puts '# 4: Long lines, random order'
      f.puts '# 5: Short lines, sorted order'
      f.puts '# 6: Short lines, inverse order'
      f.puts '# 7: Short lines, random order'
      [1, 8, 16, 32].each do |size|
        f.print "#{size}\t"
        ['ll', 'sl'].each do |mode|
          ['sor', 'inv', 'rnd'].each do |order|
            qtimes = qstats["#{size}k_#{order}_#{mode}"]
            qaverage = qtimes.inject { |s, e| s + e } / qtimes.size
            stimes = sstats["#{size}k_#{order}_#{mode}"]
            saverage = stimes.inject { |s, e| s + e } / stimes.size
            f.printf "%8.5f\t", (saverage / qaverage)
          end
        end
        f.puts ''
      end
    end

    IO.popen "gnuplot", "w" do |plot|
      plot.puts "set terminal png size 800, 600"
      plot.puts "set output './build/doc/speed_ll.png'"
      plot.puts "set xlabel 'S. (Kb)'"
      plot.puts "set ylabel 'S.U.'"
      plot.puts "set key outside right"
      plot.puts "plot \\"
      plot.puts "'./build/perf/analyzed/speedupdata' u 1:2 t 'Ordenado' w lp, \\"
      plot.puts "'./build/perf/analyzed/speedupdata' u 1:3 t 'Invertido' w lp, \\"
      plot.puts "'./build/perf/analyzed/speedupdata' u 1:4 t 'Random' w lp"
    end

    IO.popen "gnuplot", "w" do |plot|
      plot.puts "set terminal png size 800, 600"
      plot.puts "set output './build/doc/speed_sl.png'"
      plot.puts "set xlabel 'S. (Kb)'"
      plot.puts "set ylabel 'S.U.'"
      plot.puts "set key outside right"
      plot.puts "plot \\"
      plot.puts "'./build/perf/analyzed/speedupdata' u 1:5 t 'Ordenado' w lp, \\"
      plot.puts "'./build/perf/analyzed/speedupdata' u 1:6 t 'Invertido' w lp, \\"
      plot.puts "'./build/perf/analyzed/speedupdata' u 1:7 t 'Random' w lp"
    end
  end

  def export_graphics
    @stats.each do |algorithm, stats|
      File.open "build/perf/analyzed/#{algorithm}data", "w" do |f|
        f.puts '# Columns:'
        f.puts '# 1: Processed file size'
        f.puts '# 2: Long lines, sorted order'
        f.puts '# 3: Long lines, inverse order'
        f.puts '# 4: Long lines, random order'
        f.puts '# 5: Short lines, sorted order'
        f.puts '# 6: Short lines, inverse order'
        f.puts '# 7: Short lines, random order'
        [1, 8, 16, 32].each do |size|
          f.print "#{size}\t"
          ['ll', 'sl'].each do |mode|
            ['sor', 'inv', 'rnd'].each do |order|
              times = stats["#{size}k_#{order}_#{mode}"]
              average = times.inject { |s, e| s + e } / times.size
              f.printf "%8.5f\t", average
            end
          end
          f.puts ''
        end
      end
    end

    IO.popen "gnuplot", "w" do |plot|
      plot.puts "set terminal png size 800, 600"
      plot.puts "set output './build/doc/quicks_ll.png'"
      plot.puts "set xlabel 'S. (Kb)'"
      plot.puts "set ylabel 'T. (s)'"
      plot.puts "set key outside right"
      plot.puts "plot \\"
      plot.puts "'./build/perf/analyzed/quicksdata' u 1:2 t 'Ordenado' w lp, \\"
      plot.puts "'./build/perf/analyzed/quicksdata' u 1:3 t 'Invertido' w lp, \\"
      plot.puts "'./build/perf/analyzed/quicksdata' u 1:4 t 'Random' w lp"
    end

    IO.popen "gnuplot", "w" do |plot|
      plot.puts "set terminal png size 800, 600"
      plot.puts "set output './build/doc/quicks_sl.png'"
      plot.puts "set xlabel 'S. (Kb)'"
      plot.puts "set ylabel 'T. (s)'"
      plot.puts "set key outside right"
      plot.puts "plot \\"
      plot.puts "'./build/perf/analyzed/quicksdata' u 1:5 t 'Ordenado' w lp, \\"
      plot.puts "'./build/perf/analyzed/quicksdata' u 1:6 t 'Invertido' w lp, \\"
      plot.puts "'./build/perf/analyzed/quicksdata' u 1:7 t 'Random' w lp"
    end

    IO.popen "gnuplot", "w" do |plot|
      plot.puts "set terminal png size 800, 600"
      plot.puts "set output './build/doc/stooge_ll.png'"
      plot.puts "set xlabel 'S. (Kb)'"
      plot.puts "set ylabel 'T. (s)'"
      plot.puts "set key outside right"
      plot.puts "plot \\"
      plot.puts "'./build/perf/analyzed/stoogedata' u 1:2 t 'Ordenado' w lp, \\"
      plot.puts "'./build/perf/analyzed/stoogedata' u 1:3 t 'Invertido' w lp, \\"
      plot.puts "'./build/perf/analyzed/stoogedata' u 1:4 t 'Random' w lp"
    end

    IO.popen "gnuplot", "w" do |plot|
      plot.puts "set terminal png size 800, 600"
      plot.puts "set output './build/doc/stooge_sl.png'"
      plot.puts "set xlabel 'S. (Kb)'"
      plot.puts "set ylabel 'T. (s)'"
      plot.puts "set key outside right"
      plot.puts "plot \\"
      plot.puts "'./build/perf/analyzed/stoogedata' u 1:5 t 'Ordenado' w lp, \\"
      plot.puts "'./build/perf/analyzed/stoogedata' u 1:6 t 'Invertido' w lp, \\"
      plot.puts "'./build/perf/analyzed/stoogedata' u 1:7 t 'Random' w lp"
    end
  end
end

Analyzer.new.analyze
