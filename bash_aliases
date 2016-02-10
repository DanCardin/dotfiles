export TERM=screen-256color
set -s escape-time 0
alias tmux="TERM=screen-256color tmux -2"
alias vim="nvim"

# Git
alias gs='git status'
alias gb='git branch'
alias gpom='git pull origin master'
alias gpod='git pull origin develop'
alias gpoom='git push origin master'
alias gpood='git push origin develop'

# Repos
alias is2='cd /usr/local/insightsquared'
alias conf='cd /usr/local/insightsquared/configuration'
alias ise='cd /usr/local/insightsquared/is_engine'

alias ar='sudo /etc/init.d/apache2 restart'
alias nr='sudo /etc/init.d/nginx restart'
alias tw='touch /usr/local/insightsquared/is_engine/bbase/wsgi_handler.py'
alias issink='python /usr/local/insightsquared/is_engine/issink/issink.py -v'
alias issink_source='python /usr/local/insightsquared/is_engine/issink/issink.py -v --db-tmp --get-input --source'
alias runlib='python /usr/local/insightsquared/is_engine/isdata/runlib.py'
alias migrate='python /usr/local/insightsquared/is_engine/bbase/manage.py migrate'
alias syncdb='python /usr/local/insightsquared/is_engine/bbase/manage.py syncdb'
alias test_site='python /usr/local/insightsquared/is_engine/bbase/bin/test_site.py -u -j -t 100'
alias gen_report='python /usr/local/insightsquared/configuration/screens2/gen_report.py'
alias db='mysql -u root -D insightsquared'
alias dbshell='python -i /usr/local/insightsquared/is_tools/user_scripts/foxtrot/model_db.py'
alias show_clients='python /usr/local/insightsquared/is_tools/user_scripts/foxtrot/client_mgmt.py show'
alias watch='python /usr/local/insightsquared/is_engine/bbase/bin/watcher.py'
alias megatest="/usr/local/insightsquared/is_engine/bbase/bin/run.py -m bbase.megatest"
alias run='/usr/local/insightsquared/is_engine/bbase/bin/run.py'
alias nosetests='run -m nose --config=/usr/local/insightsquared/is_engine/setup.cfg'
alias i='ipython --profile=is2'

alias nooooope='tw;tw;tw;tw;tw;tw;ar;nr'
alias shellplus='python /usr/local/insightsquared/is_engine/bbase/manage.py shell_plus'
alias get='run -m megatest.get'
