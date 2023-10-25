local telescope = require('telescope')

local picker = require('telescope/_extensions/zsh/picker')

return telescope.register_extension({
  -- setup = function(ext_conf, conf)
  -- end,
  exports = {
    zsh = picker,
  },
})
