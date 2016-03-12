function git_branch_name -d "Get the name of the current Git branch"
    if not command git symbolic-ref --short HEAD ^ /dev/null
        command git rev-parse --short HEAD ^ /dev/null
    end
end
