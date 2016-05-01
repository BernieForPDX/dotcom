require 'json'

contests = JSON.parse(File.read('data/contests.json'))
candidates = JSON.parse(File.read('data/candidates.json'))

contests << 'Portland Mayor'
contests.each do |contest|
  candidates.select{ |cand| cand['office'] == contest }.each do |candidate|
    name_short = candidate['name'].gsub(/\s/,'_').downcase
    next unless candidate['photo']
    system "convert -resize 600x600 #{candidate['photo']} images/candidates/shared/#{name_short}.png"
    system "composite -gravity SouthEast images/2016.png images/candidates/shared/#{name_short}.png images/candidates/shared/#{name_short}.png"
  end
end
