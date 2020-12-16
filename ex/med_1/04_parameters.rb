birds = %w(raven finch hawk eagle)

def bird_types(birds)
  yield(birds)
end

bird_types(birds) { |_, _, *raptors| raptors.each { |raptor| puts raptor } }
