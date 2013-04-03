
require 'tk'
def make_win
  root=TkRoot.new{
    title "检验科在岗操练软件"
  }
  begin
    $win.destroy
  rescue
  end
  $win = TkToplevel.new(root)
  TkButton.new($win) {
    text 'Window Dismiss'
    command "$win.destroy"
    pack
  }
end

TkButton.new {
  text 'make Window'
  command 'make_win'
  pack('fill' => 'x')
}

Tk.mainloop