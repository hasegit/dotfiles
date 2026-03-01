--[[
mini.surround - Add, delete, replace surroundings (brackets, quotes, tags).

Keybindings
┌─────────────────┬────────────────────┬──────────────────┐
│ Action          │ Key                │ Example          │
├─────────────────┼────────────────────┼──────────────────┤
│ Add             │ sa{motion}{char}   │ saiw" → add ""   │
├─────────────────┼────────────────────┼──────────────────┤
│ Delete          │ sd{char}           │ sd" → remove "   │
├─────────────────┼────────────────────┼──────────────────┤
│ Replace         │ sr{old}{new}       │ sr"' → " to '    │
├─────────────────┼────────────────────┼──────────────────┤
│ Find next       │ sf{char}           │ sf( → jump to (  │
├─────────────────┼────────────────────┼──────────────────┤
│ Find previous   │ sF{char}           │ sF( → jump back  │
├─────────────────┼────────────────────┼──────────────────┤
│ Highlight       │ sh{char}           │ sh" → highlight  │
└─────────────────┴────────────────────┴──────────────────┘

Examples (cursor on "hello")
┌───────────────────────────────┬─────────┬───────────────────┐
│ Goal                          │ Command │ Result            │
├───────────────────────────────┼─────────┼───────────────────┤
│ hello → "hello"               │ saiw"   │ "hello"           │
├───────────────────────────────┼─────────┼───────────────────┤
│ hello → (hello)               │ saiw)   │ (hello)           │
├───────────────────────────────┼─────────┼───────────────────┤
│ "hello" → 'hello'             │ sr"'    │ 'hello'           │
├───────────────────────────────┼─────────┼───────────────────┤
│ "hello" → hello               │ sd"     │ hello             │
├───────────────────────────────┼─────────┼───────────────────┤
│ hello → <div>hello</div>      │ saiwt   │ (prompts for tag) │
└───────────────────────────────┴─────────┴───────────────────┘

Surround characters
┌──────┬──────────────────┐
│ Char │ Surround         │
├──────┼──────────────────┤
│ )    │ () no space      │
├──────┼──────────────────┤
│ (    │ ( ) with space   │
├──────┼──────────────────┤
│ }    │ {} no space      │
├──────┼──────────────────┤
│ {    │ { } with space   │
├──────┼──────────────────┤
│ t    │ HTML tag (prompt)│
├──────┼──────────────────┤
│ f    │ Function call    │
└──────┴──────────────────┘

Tips
- sa = surround add, sd = surround delete, sr = surround replace
- Works with any motion: sa2aw" = surround 2 words
- Works with text objects: saip( = surround paragraph
]]
require("mini.surround").setup()
