library(reticulate)

gi <- import("gi")
gi$require_version("Gtk", "3.0")
Gtk <- import("gi.repository.Gtk")

ToggleButtonWindow <- PyClass(
  "ToggleButtonWindow",
  inherit = Gtk$Window,
  defs = list(
    `__init__` = function(self) {
      super()$`__init__`(title="ToggleButton Demo")
      self$set_border_width(10)
      
      hbox = Gtk$Box(spacing=6)
      self$add(hbox)
      
      button = Gtk$ToggleButton(label="Button 1")
      button$connect("toggled", self$on_button_toggled, "1")
      hbox$pack_start(button, 1, 1, 0)
      
      button = Gtk$ToggleButton(label="B_utton 2", use_underline=1)
      button$set_active(1)
      button$connect("toggled", self$on_button_toggled, "2")
      hbox$pack_start(button, 1, 1, 0)
    },
    on_button_toggled = function(self, button, name) {
      if (button$get_active()) {
        state = "on"
      } else {
        state = "off"
      }
      
      print(paste("Button", name, "was turned", state))
    }
  )
)


win <- ToggleButtonWindow()

win$connect("destroy", Gtk$main_quit)
win$show_all()
Gtk$main()
