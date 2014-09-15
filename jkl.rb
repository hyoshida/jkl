require 'io/console'

string = ''
ok_count = 0
ng_count = 0

STDIN.raw do |io|
  "OK: #{ok_count}, NG: #{ng_count}, input: ".display

  while (ch = io.getch) != 'q'
    string << ch

    "\rOK: #{ok_count}, NG: #{ng_count}, input: ".display

    if (string == 'jkl;')
      format('%3s', 'OK!').display
      string = ''
      ok_count += 1
    elsif ('jkl;'.index(string) == 0)
      format('%3s', string).display
    else
      format('%3s', 'NG!').display
      ng_count += 1
      string = ''
    end
  end
end
