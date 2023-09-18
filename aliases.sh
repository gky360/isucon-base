# isucon
alias al='sudo alp ltsv -c ~/alp.yml'
alias als='sudo alp ltsv -c ~/alp.yml > alp-result.txt && ~/dotfiles/scripts/slack.sh isucon alp-result alp-result.txt && cat alp-result.txt && rm -f alp-result.txt'
alias pt='sudo pt-query-digest --limit 10 --report-format profile,query_report /var/log/mysql/slow.log | less'
alias pts='sudo pt-query-digest --limit 10 --report-format profile,query_report /var/log/mysql/slow.log ~/alp.yml > pt-result.txt && ~/dotfiles/scripts/slack.sh isucon pt-result pt-result.txt && cat pt-result.txt && rm -f pt-result.txt'
alias pp='go tool pprof -png -output ~/pprof/pprof.png http://localhost:6060/debug/pprof/profile'
alias pps='go tool pprof -png -output pprof.png http://localhost:6060/debug/pprof/profile && ~/dotfiles/scripts/slack.sh isucon pprof pprof.png && rm -f pprof.png'
alias ppb='go tool pprof -http=":1234" http://localhost:6060/debug/pprof/profile'

