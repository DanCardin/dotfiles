export TERM=screen-256color
set -s escape-time 0
alias tmux="TERM=screen-256color tmux"
alias vim="nvim"

# File-tree
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sl='sl'

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
alias ice='cd /usr/local/insightsquared/is_ice/'
alias ist='cd /usr/local/insightsquared/is_tools/" Smart way to move between windows'

alias ar='sudo /etc/init.d/apache2 restart'
alias nr='sudo /etc/init.d/nginx restart'
alias tw='touch /usr/local/insightsquared/is_engine/bbase/wsgi_handler.py'
alias tg='touch /usr/local/insightsquared/is_engine/bbase/wsgi_handler.py && fg'
alias watch='python /usr/local/insightsquared/is_engine/bbase/bin/wsgi_watcher.py /usr/local/insightsquared/is_engine/bbase/wsgi_handler.py /usr/local/insightsquared/is_engine/'
alias issink='python /usr/local/insightsquared/is_engine/issink/issink.py -v'
alias issink_source='python /usr/local/insightsquared/is_engine/issink/issink.py -v --db-tmp --get-input --source'
alias issink_update='python /usr/local/insightsquared/is_engine/issink/issink.py -v -c SFDCdev -c is2 -c ISMINI -c ISMINI_SF -c BlueStone -c Arrows -c Monetate'
alias runlib='python /usr/local/insightsquared/is_engine/isdata/runlib.py'
alias migrate='python /usr/local/insightsquared/is_engine/bbase/manage.py migrate'
alias syncdb='python /usr/local/insightsquared/is_engine/bbase/manage.py syncdb'
alias zoo='python /usr/local/insightsquared/is_engine/bbase/bin/zookeeper.py -v -s'
alias foot='python /usr/local/insightsquared/is_engine/bbase/bin/test_foot.py -v -d'
alias test_site='python /usr/local/insightsquared/is_engine/bbase/bin/test_site.py -u -j -t 100'
alias test_sites='python /usr/local/insightsquared/is_engine/bbase/bin/test_site.py -u -j -t 101 -c is2 -c ISMINI -c ISMINI_SF -c BlueStone -c Arrows -c Monetate'
alias test_config='python /usr/local/insightsquared/is_engine/isdata/bin/test_config.py'
alias gen_report='python /usr/local/insightsquared/configuration/screens2/gen_report.py'
alias db='mysql -u root -D insightsquared'
alias pgit='python /usr/local/insightsquared/is_tools/isgit/pgit'
alias apr='python /usr/local/insightsquared/is_tools/user_scripts/foxtrot/auto_pr.py'
alias aprf='python /usr/local/insightsquared/is_tools/user_scripts/foxtrot/auto_pr.py Foxtrot'
alias aprb='python /usr/local/insightsquared/is_tools/user_scripts/foxtrot/auto_pr.py Bravo'
alias aprp='python /usr/local/insightsquared/is_tools/user_scripts/foxtrot/auto_pr.py Papa'
alias dbshell='python -i /usr/local/insightsquared/is_tools/user_scripts/foxtrot/model_db.py'
alias show_clients='python /usr/local/insightsquared/is_tools/user_scripts/foxtrot/client_mgmt.py show'
alias drop_client='python /usr/local/insightsquared/is_tools/user_scripts/foxtrot/client_mgmt.py drop'
alias flake8='echo "ASDF"'

shopt -s expand_aliases
