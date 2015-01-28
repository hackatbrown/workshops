$(document).ready(function() {
  $("#number1").on("keypress", function (e) {
    if (e.keyCode == 13) {
      $.get("/add1", {toAdd: $("#number1").val()}, function(data) {
        $(".toRemove").remove();
        $("#wrapper").append("<h3> Boom! </h3>")
        $("#wrapper").append("<h3>" + data.result + "</h3>")
      });
    }
  });
});
