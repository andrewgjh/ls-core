SMILEY_FEATURES = {
  eyes: %w(: ;),
  nose: %w(- ~),
  mouth: [")", "D"]
}

def count_smileys(arr)
  arr.count do |smiley| 
    split_face = smiley.chars
    (SMILEY_FEATURES[:eyes] & split_face).any? &&
    (SMILEY_FEATURES[:mouth] & split_face).any?
  end
end




# p count_smileys([]) == 0
p count_smileys([":D",":~)",";~D",":)"]) #== 4
p count_smileys([":)",":(",":D",":O",":;"]) #== 2
p count_smileys([";]", ":[", ";*", ":$", ";-D"]) #== 1
# p count_smileys([";", ")", ";*", ":$", "8-D"]) == 0
