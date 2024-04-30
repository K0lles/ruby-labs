def preprocess_code(code)
  code.map do |line|
    if line.strip.start_with?('#')
      line.gsub!('#', '_')
    end
    line.gsub!(/[a-z]/) { |match| match.upcase }
    line
  end
end


code_fragment = [
  "#include <iostream>",
  "using namespace std;",
  "#define MAX_VALUE 100",
  "int main() {",
  "    int number = MAX_VALUE;",
  "    cout << number << endl;",
  "    return 0;",
  "}"
]

preprocessed_code = preprocess_code(code_fragment)
puts preprocessed_code

