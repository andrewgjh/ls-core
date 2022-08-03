# frozen_string_literal: true

def uppercase?(char)
  char == char.upcase
end

def decipher_rot13(string)
  string.chars.map do |char|
    upcase = uppercase?(char)
    char_ord = char.downcase.ord
    case char_ord
    when (97..109) then char_ord += 13
    when (110..122) then char_ord -= 13
    end
    upcase ? char_ord.chr.upcase : char_ord.chr
  end.join
end

p decipher_rot13('Nqn Ybirynpr')

p decipher_rot13('Tenpr Ubccre')
p decipher_rot13('Nqryr Tbyqfgvar')
p decipher_rot13('Nyna Ghevat')
p decipher_rot13('Puneyrf Onoontr')
p decipher_rot13('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p decipher_rot13('Wbua Ngnanfbss')
p decipher_rot13('Ybvf Unvog')
p decipher_rot13('Pynhqr Funaaba')
p decipher_rot13('Fgrir Wbof')
p decipher_rot13('Ovyy Tngrf')
p decipher_rot13('Gvz Orearef-Yrr')
p decipher_rot13('Fgrir Jbmavnx')
p decipher_rot13('Xbaenq Mhfr')
p decipher_rot13('Fve Nagbal Ubner')
p decipher_rot13('Zneiva Zvafxl')
p decipher_rot13('Lhxvuveb Zngfhzbgb')
p decipher_rot13('Unllvz Fybavzfxv')
p decipher_rot13('Tregehqr Oynapu')
