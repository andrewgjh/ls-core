class DNA
  def initialize(dna_strand)
    @dna_strand = dna_strand
  end

  def hamming_distance(other_strand)
    mutations = 0
    [dna_strand, other_strand].map(&:size).min.times do |idx|
      mutations += 1 unless @dna_strand[idx] == other_strand[idx]
    end
    mutations
  end

  protected

  attr_reader :dna_strand
end
