# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

def staggered_case(text, consider_alpha=true)
  upcasing = false
  final = text.chars.map do |char|
    if !consider_alpha || char =~ /[a-zA-Z]/i
      upcasing = !upcasing
    end
    upcasing ? char.upcase : char.downcase
  end
  final.join()
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
