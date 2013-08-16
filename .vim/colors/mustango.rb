vim_colors "mustango" do
    author "Konstantin Kudryashov (ever.zet@gmail.com)"
    notes  "256 colors version of mustang"

    reset      true
    background :dark

    CursorLine   "NONE",   "262626"
    CursorLineNr "444444", "262626"
    CursorColumn "NONE",   "2d2d2d"
    ColorColumn  "NONE",   "262626"
    MatchParen   "NONE",   "444444"
    Pmenu        "ffffff", "444444"
    PmenuSel     "000000", "b1d631"

    Cursor       "000000", "b1d631"
    Normal       "e2e2e5", "202020"
    Conceal      "e2e2e5", "202020"
    SpecialKey   "444444", "303030"
    NonText      "444444", "303030"
    LineNr       "444444", "262626"
    SignColumn   "444444", "262626"

    StatusLine   "d3d3d5", "444444"
    StatusLineNC "939393", "444444"
    VertSplit    "444444", "444444"
    Folded       "a0a8b0", "384048"
    Title        "f6f3e8", "NONE"
    Visual       "faf4c6", "3c414c"
    Search       "000000", "ff9800"

    Comment      "808080", "NONE",   :gui => "italic", :cterm => "italic"
    Todo         "000000", "e6ea50", :gui => "italic", :cterm => "italic"
    Boolean      "ff9800", "NONE"
    String       "b1d631", "NONE",   :gui => "italic", :cterm => "italic"
    Identifier   "b1d631", "NONE"
    Function     "faf4c6", "NONE",   :gui => "bold",   :cterm => "bold"
    Type         "7e8aa2", "NONE"
    Statement    "7e8aa2", "NONE"
    Keyword      "ff9800", "NONE"
    Constant     "ff9800", "NONE"
    Number       "ff9800", "NONE"
    Special      "ff9800", "NONE"
    PreProc      "faf4c6", "NONE"

    TabLine      "cccccc", "3f3f3f"
    TabLineSel   "c7c7c7", "6b6b6b"
    TabLineFill  "NONE",   "3f3f3f"

    DiffAdd      "ffffff", "01610b"
    DiffText     "ffffff", "006161"
    DiffChange   "NONE",   "NONE"
    DiffDelete   "ffffff", "610006"

    PythonOperator "7e8aa2", "NONE"
    Question       "ff9800", "NONE"
    SpellBad       "ff2222", "NONE", :cterm => "italic"

    # PLUGINS

    EasyMotionTarget "b1d631", "NONE"
    EasyMotionShade  "444444", "NONE"
    LustySelected    "ff9800", "NONE"
    LustyDir         "b1d631", "NONE"

    SyntasticErrorSign   "ff2222", "262626"
    SyntasticWarningSign "bbbb00", "262626"
    SyntasticErrorLine   "e2e2e5", "ff2222"
    SyntasticWarningLine "e2e2e5", "bbbb00"

    GitGutterAdd          "009900", "262626"
    GitGutterChange       "bbbb00", "262626"
    GitGutterDelete       "ff2222", "262626"
    GitGutterChangeDelete "bbbb00", "262626"

    phpspecExampleSubject "faf4c6", "NONE",   :gui => "bold",   :cterm => "bold"
end
