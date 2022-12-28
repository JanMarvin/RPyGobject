library(reticulate)

gi <- import("gi")
gi$require_version("Gtk", "3.0")
Gtk <- import("gi.repository.Gtk")

MyWindow <- PyClass(
  "MyWindow",
  inherit = Gtk$Window,
  defs = list(
    `__init__` = function(self) {
      super()$`__init__`(title="Hello World")
      self$button <- Gtk$Button(label="Click Here")
      self$button$connect("clicked", self$on_button_clicked)
      self$add(self$button)
    },
    on_button_clicked = function(self, widget) {
      print("Hello World")
    }
  ))

window <- MyWindow()

window$connect("destroy", Gtk$main_quit)
window$show_all()
Gtk$main()
