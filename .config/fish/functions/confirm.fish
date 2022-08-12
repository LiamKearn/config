function confirm -d "Prompt the user for yes/no confirmation using argv 1 as msg."
  while true
    read -l -P "$argv[1] [y/N] " confirm

    switch $confirm
      case Y y
        return 0
      case '' N n
        return 1
    end
  end
end
