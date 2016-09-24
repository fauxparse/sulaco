if ENV.fetch("COVERAGE", false)
  if ENV["CIRCLE_ARTIFACTS"]
    dir = File.join(ENV["CIRCLE_ARTIFACTS"], "coverage")
    SimpleCov.coverage_dir(dir)
  end

  SimpleCov.start 'rails' do
    add_filter '/app/channels'
    add_filter { |source_file| source_file.lines.count <= 5 }
  end
end
