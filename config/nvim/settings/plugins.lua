local iron = require('iron')

iron.core.add_repl_definitions {
  python = {
    mycustom = {
      command = {"mycmd"}
    }
  }
}

iron.core.set_config {
  preferred = {
    python = "ptpython",
  }
}
