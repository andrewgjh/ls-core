# template = File.read('madlibs.txt')


# madlibs_words = {
#   adjective: %w(quick lazy sleepy ugly),
#   noun: %w(fox dog head leg),
#   verb: %w(jumps lifts bites licks),
#   adverb: %w(easily lazily noisily excitedly)
# }

# madlibs_words.each do |replacement, words|
#   template.gsub!("%{#{replacement.to_s}}", words.sample)
# end

# puts template


ADJECTIVES = %w(quick lazy sleepy ugly sexy dirty).freeze
NOUNS      = %w(fox dog head leg cat tail chicken porcupine).freeze
VERBS      = %w(spins bites licks hurdles pukes screams).freeze
ADVERBS    = %w(easily lazily noisly excitedly hastily).freeze

File.open('madlibs.txt') do |file|
  file.each do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end
