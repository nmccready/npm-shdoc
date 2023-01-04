
#!/usr/bin/env bash
set -e -o pipefail

./dist/shdoc < ./test/fixture/say-hello.sh > dist/say-hello.md
diff ./test/fixture/say-hello.md dist/say-hello.md
