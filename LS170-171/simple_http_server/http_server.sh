#!/opt/homebrew/Cellar/bash/5.1.16/bin/bash

function server () {
  while true
  do
    read method path version
    if [[ $method = 'GET' ]]
    then
      if [[ -f "./www/$path" ]]
      then
        echo -ne 'HTTP/1.1 200 OK\r\n'
        echo -e 'Content-Type: text/html; charset=utf-8'
        echo -e "Content-Length: `wc -c < "./www/$path"`\r\n"
        cat "./www/$path"
      else
        echo -ne 'HTTP/1.1 404 Not Found\r\n'
        echo -e 'Content-Length: 0\r\n'
      fi
    else
      echo -ne 'HTTP/1.1 400 Bad Request\r\n\'
      echo -e 'Content-Length: 0\r\n'
    fi
  done
}

coproc SERVER_PROCESS { server; }

nc -klv 2345 <&${SERVER_PROCESS[0]} >&${SERVER_PROCESS[1]}