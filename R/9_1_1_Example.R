library(reticulate)

gi <- import("gi")
gi$require_version("Gtk", "3.0")
Gtk <- import("gi.repository.Gtk")

ButtonWindow <- PyClass(
  "ButtonWindow",
  inherit = Gtk$Window,
  defs = list(
    `__init__` = function(self) {
      super()$`__init__`(title="Button Demo")
      self$set_border_width(10)
      
      hbox = Gtk$Box(spacing=6)
      self$add(hbox)
      
      button <- Gtk$Button$new_with_label("Click Me")
      button$connect("clicked", self$on_click_me_clicked)
      hbox$pack_start(button, 1, 1, 0)
      
      button <- Gtk$Button$new_with_mnemonic("_Open")
      button$connect("clicked", self$on_open_clicked)
      hbox$pack_start(button, 1, 1, 0)

      button <- Gtk$Button$new_with_mnemonic("_Close")
      button$connect("clicked", self$on_close_clicked)
      hbox$pack_start(button, 1, 1, 0)
    },
    on_click_me_clicked = function(self, button) {
      print("'Click Me' button was clicked")
    },
    on_open_clicked = function(self, button) {
      print("'Open' button was clicked")
    },
    on_close_clicked = function(self, button) {
      print("'Close' button was clicked")
      self$destroy()
    }
  )
)


win <- ButtonWindow()

win$connect("destroy", Gtk$main_quit)
win$show_all()
Gtk$main()
