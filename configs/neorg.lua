require('neorg').setup {
	load = {
		['core.defaults'] = {},
		['core.concealer'] = {},
		["core.export.markdown"] = {},
		["core.export"] = {},
		['core.completion'] = {
			config = {
				engine = 'nvim-cmp'
			}
		},
		["core.dirman"] = {
			config = {
				workspaces = {
					notes = "~/dox/.notes",
					todo = "~/dox/.todo",
				}
			}
		},
		-- ['core.gtd.base'] = {
		-- 	config = {
		-- 		workspace = 'todo'
		-- 	}
		-- },
		['core.keybinds'] = {
			config = {
				neorg_leader = '<leader>n'
			}
		},
-- 		['core.highlights'] = {
-- 			config = {
-- 				highlights = {
-- 					headings = {
-- 						['1'] = {
-- 							title = '+Heading1',
-- 							prefix = '+Heading1'
-- 						},
-- 						['2'] = {
-- 							title = '+Heading2',
-- 							prefix = '+Heading2'
-- 						},
-- 						['3'] = {
-- 							title = '+Heading3',
-- 							prefix = '+Heading3'
-- 						},
-- 						['4'] = {
-- 							title = '+Heading4',
-- 							prefix = '+Heading4'
-- 						},
-- 						['5'] = {
-- 							title = '+Heading5',
-- 							prefix = '+Heading5'
-- 						},
-- 						['6'] = {
-- 							title = '+Heading6',
-- 							prefix = '+Heading6'
-- 						}
-- 					},
-- 					links = {
-- 						file = {
-- 							[""] = '+TSURI'
-- 						}
-- 					}
-- 				}
-- 			}
-- 		}
	}
}
